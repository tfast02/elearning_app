import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text64Widget({required String text, double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500, Color color = const Color.fromRGBO(64, 64, 64, 1)}) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Widget text127Widget({required String text, double fontSize = 16,
  FontWeight fontWeight = FontWeight.w400, Color color = const Color.fromRGBO(127, 127, 127, 1)}) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}