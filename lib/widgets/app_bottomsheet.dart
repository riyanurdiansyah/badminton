import 'package:badminton/controllers/match_controller.dart';
import 'package:badminton/styles/app_color.dart';
import 'package:badminton/validation/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBottomSheet {
  static sheetAddNama(int slug) {
    final matchC = Get.put(MatchController());
    return Get.defaultDialog(
      radius: 10,
      title: 'Pemain',
      content: TextFormField(
        keyboardType: TextInputType.name,
        style: GoogleFonts.lato(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: 'Masukkan nama pemain',
          labelStyle: GoogleFonts.lato(
            fontSize: 14,
          ),
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
        controller: matchC.tcName,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => AppValidator.checkNama(value!),
      ),
      confirm: SizedBox(
        height: 45,
        width: Get.size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          onPressed: () => matchC.fnAddNamaPemain(slug),
          child: Text(
            'TAMBAH',
            style: GoogleFonts.aBeeZee(
              letterSpacing: 5,
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
