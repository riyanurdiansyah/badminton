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
}
