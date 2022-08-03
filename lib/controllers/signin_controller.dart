import 'package:badminton/controllers/spf_controller.dart';
import 'package:badminton/models/user_m.dart';
import 'package:badminton/routes/app_route_name.dart';
import 'package:badminton/styles/app_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final GlobalKey<FormState> formSignin = GlobalKey<FormState>();

  final _tcEmail = TextEditingController();
  TextEditingController get tcEmail => _tcEmail;

  final _tcHandphone = TextEditingController();
  TextEditingController get tcHandphone => _tcHandphone;

  final _tcPassword = TextEditingController();
  TextEditingController get tcPassword => _tcPassword;

  final Rx<bool> _isLoading = false.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isHidePassword = true.obs;
  Rx<bool> get isHidePassword => _isHidePassword;

  final _spfC = Get.find<SpfController>();

  void hidePassword() {
    _isHidePassword.value = !_isHidePassword.value;
    _isLoading.value = false;
  }

  Future<void> signin() async {
    try {
      _isLoading.value = true;

      // if (responseLogin.user != null) {
      final response = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: _tcEmail.value.text)
          .get();

      if (response.docs.isNotEmpty) {
        final responseLogin = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: response.docs[0]['email'], password: _tcPassword.text);

        if (responseLogin.user != null) {
          final data = response.docs[0];
          _spfC.fnSaveDataToSession(UserModel.fromJson(data.data()));
          Get.offAllNamed(AppRouteName.home);
        } else {
          AppDialog.dialogWithRoute(
              'Error', 'Gagal.. silahkan coba lagi', 'Tutup');
        }
      }

      _isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      _isLoading.value = false;
      AppDialog.dialogWithRoute('Error', e.toString(), 'Tutup');
    } catch (e) {
      _isLoading.value = false;
      AppDialog.dialogWithRoute('Error', e.toString(), 'Tutup');
    }
  }
}
