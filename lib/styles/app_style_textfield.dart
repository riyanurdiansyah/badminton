import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppStyleTextfield {
  static authFormInput(String labelText, String hintText, double fontSize) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      labelText: labelText,
      hintStyle: GoogleFonts.lato(
        fontSize: 14,
      ),
      labelStyle: GoogleFonts.lato(
        fontSize: 14,
        color: primaryColor,
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
    );
  }

  InputDecoration kAuthTextFormInputDecoration(
      String labelText, double fontSize) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      labelText: labelText,
      hintStyle: GoogleFonts.lato(
        fontSize: 14,
      ),
      labelStyle: GoogleFonts.lato(
        fontSize: 14,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
