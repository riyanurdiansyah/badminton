import 'package:badminton/controllers/spf_controller.dart';
import 'package:badminton/models/user_m.dart';
import 'package:badminton/routes/app_route_name.dart';
import 'package:badminton/styles/app_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formSignupEmail = GlobalKey<FormState>();

  final GlobalKey<FormState> formKeySignup = GlobalKey<FormState>();

  final _tcEmail = TextEditingController();
  TextEditingController get tcEmail => _tcEmail;

  final _tcName = TextEditingController();
  TextEditingController get tcName => _tcName;

  final _tcPassword = TextEditingController();
  TextEditingController get tcPassword => _tcPassword;

  final _tcPasswordConfirm = TextEditingController();
  TextEditingController get tcPasswordConfirm => _tcPasswordConfirm;

  final Rx<bool> _isHidePassword = true.obs;
  Rx<bool> get isHidePassword => _isHidePassword;

  final Rx<bool> _isHideKonfirmasiPassword = true.obs;
  Rx<bool> get isHideKonfirmasiPassword => _isHideKonfirmasiPassword;

  final Rx<bool> _isLoading = false.obs;
  Rx<bool> get isLoading => _isLoading;

  final _spfC = Get.find<SpfController>();

  void fnHidePassword() {
    print("OKE");
    _isHidePassword.value = !_isHidePassword.value;
  }

  void fnHideKonfirmasiPassword() {
    _isHideKonfirmasiPassword.value = !_isHideKonfirmasiPassword.value;
  }

  Future<void> signUp() async {
    if (formSignupEmail.currentState!.validate()) {
      try {
        _isLoading.value = true;
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _tcEmail.text,
          password: _tcPassword.text,
        );
        if (userCredential.user!.uid.isNotEmpty) {
          await addUserFirestore(
            email: _tcEmail.text,
            username: _tcName.text,
            phone: '-',
            id: userCredential.user!.uid,
          );
          _isLoading.value = true;
        } else {
          AppDialog.dialogWithRoute(
              'Error', 'Gagal.. silahkan coba lagi', 'Tutup');
          _isLoading.value = true;
        }
      } on FirebaseAuthException catch (e) {
        _isLoading.value = true;
        AppDialog.dialogWithRoute('Error', e.toString(), 'Tutup');
      } catch (e) {
        _isLoading.value = true;
        AppDialog.dialogWithRoute('Error', e.toString(), 'Tutup');
      }
    }
  }

  Future<void> addUserFirestore({
    @required String? email,
    @required String? username,
    @required String? phone,
    @required String? id,
  }) async {
    Map<String, dynamic> request = {
      "uid": id,
      "username": username,
      "email": email,
      "handphone": phone,
      "status": true,
      "role": 1,
    };

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .set(request)
          .whenComplete(() async {
        final response =
            await FirebaseFirestore.instance.collection('users').doc(id).get();
        _spfC.fnSaveDataToSession(UserModel.fromJson(response.data()!));
        Get.offAllNamed(AppRouteName.home);
      });
    } catch (e) {
      AppDialog.dialogWithRoute('Error', e.toString(), 'Tutup');
    }
  }
}
