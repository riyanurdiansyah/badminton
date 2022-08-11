import 'package:badminton/controllers/signin_controller.dart';
import 'package:badminton/routes/app_route_name.dart';
import 'package:badminton/styles/app_format_txt.dart';
import 'package:badminton/styles/app_style_textfield.dart';
import 'package:badminton/validation/app_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final signinC = Get.find<SigninController>();

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
                  color: Colors.amber.withOpacity(0.7),
                ),
                child: Image.asset('assets/logo.jpeg'),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Badminton Apps',
                style: GoogleFonts.adventPro(
                  fontSize: 35,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                key: signinC.formSignin,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: signinC.tcEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        AppLowerCaseTxt(),
                      ],
                      decoration: AppStyleTextfield.authFormInput(
                        'Username',
                        'johndoe',
                        14,
                      ),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => AppValidator.requiredField(value!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: signinC.tcPassword,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                        ),
                        textInputAction: TextInputAction.done,
                        decoration: AppStyleTextfield.authFormInput(
                                'Password', '********', 14)
                            .copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility,
                              color: signinC.isHidePassword.value == true
                                  ? Colors.grey[600]
                                  : Colors.amber,
                            ),
                            onPressed: () => signinC.hidePassword(),
                          ),
                        ),
                        obscureText: signinC.isHidePassword.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            AppValidator.checkFieldPass(value!),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
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
                    onPressed:
                        signinC.isLoading.value ? null : () => signinC.signin(),
                    child: signinC.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          )
                        : Text(
                            'MASUK',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                text: TextSpan(
                  text: 'Belum punya akses? ',
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Daftar',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(AppRouteName.signup),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
