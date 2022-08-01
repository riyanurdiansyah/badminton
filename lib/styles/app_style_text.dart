import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyleText {
  static styleAbeezee({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.aBeeZee(
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static styleLato({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) {
    return GoogleFonts.lato(
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 1,
    );
  }

  static styleMonsterat({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 1,
    );
  }

  static styleAdventPro({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.adventPro(
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
