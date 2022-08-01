import 'package:badminton/controllers/signin_controller.dart';
import 'package:badminton/routes/app_route_name.dart';
import 'package:badminton/styles/app_color.dart';
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
                  color: secondaryColor.withOpacity(0.7),
                ),
                child: const FlutterLogo(),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'My Indi Mobile',
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
                child: TextFormField(
                  // controller: signupC.tcHandphone,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ], // Only number
                  style: GoogleFonts.lato(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: '81xxxxxxxxx',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    labelStyle: GoogleFonts.lato(
                      fontSize: 14,
                    ),
                    prefixText: '+62',
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  controller: signinC.tcHandphone,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => AppValidator.checkNumberPhone(value!),
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
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: signinC.isLoading.value ? null : () {},
                    child: signinC.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : Text(
                            'MASUK',
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
                height: 16,
              ),
              RichText(
                text: TextSpan(
                  text: 'Belum punya akun? ',
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Daftar',
                      style: const TextStyle(
                        color: primaryColor,
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
