import 'package:badminton/controllers/signup_controller.dart';
import 'package:badminton/styles/app_format_txt.dart';
import 'package:badminton/styles/app_style_textfield.dart';
import 'package:badminton/validation/app_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final signupC = Get.find<SignupController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber.withOpacity(0.6),
                ),
                child: const FlutterLogo(
                  size: 80,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'DAFTAR',
                style: GoogleFonts.adventPro(
                  fontSize: 35,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                key: signupC.formSignupEmail,
                child: Column(
                  children: [
                    TextFormField(
                      controller: signupC.tcName,
                      keyboardType: TextInputType.name,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        AppLowerCaseTxt(),
                      ],
                      decoration: AppStyleTextfield.authFormInput(
                          'Username', 'johndoe', 14),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => AppValidator.requiredField(
                        value!,
                        errorMsg: 'Username tidak boleh kosong',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: signupC.tcEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                      ),
                      decoration: AppStyleTextfield.authFormInput(
                          'Email', 'email@hamburin.com', 14),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => AppValidator.checkEmail(value!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: signupC.tcPassword,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: AppStyleTextfield.authFormInput(
                                'Password', '********', 14)
                            .copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility,
                              color: signupC.isHidePassword.value
                                  ? Colors.grey[600]
                                  : Colors.amber,
                            ),
                            onPressed: () => signupC.fnHidePassword(),
                          ),
                        ),
                        obscureText: signupC.isHidePassword.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            AppValidator.checkFieldPass(value!),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                          controller: signupC.tcPasswordConfirm,
                          style: GoogleFonts.lato(
                            fontSize: 14,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: AppStyleTextfield.authFormInput(
                                  'Konfirmasi Password', '********', 14)
                              .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility,
                                color: signupC.isHideKonfirmasiPassword.value
                                    ? Colors.grey[600]
                                    : Colors.amber,
                              ),
                              onPressed: () =>
                                  signupC.fnHideKonfirmasiPassword(),
                            ),
                          ),
                          obscureText: signupC.isHideKonfirmasiPassword.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              AppValidator.checkFieldMatchPass(
                                  value!, signupC.tcPassword.value.text)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Obx(
                () => SizedBox(
                  height: 45,
                  width: Get.size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: signupC.isLoading.value
                        ? null
                        : () {
                            signupC.signUp();
                          },
                    child: signupC.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          )
                        : Text(
                            'DAFTAR',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                  text: 'Sudah punya akun? ',
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Masuk',
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w800,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
