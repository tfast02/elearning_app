import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget logoWidget() {
  return  Padding(
    padding: const EdgeInsets.only(left: 130),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'V ',
            style: GoogleFonts.righteous(
              fontSize: 64,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFC43021),
            ),
          ), // V
          TextSpan(
            text: 'K ',
            style: GoogleFonts.righteous(
              fontSize: 64,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFF7961E),
            ),
          ), // K
          TextSpan(
            text: 'U',
            style: GoogleFonts.righteous(
              fontSize: 64,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF374F8A),
            ),
          ), // U
        ],
      ),
    ),
  );
}

Widget subLogoWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 110),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'VIETNAM ',
            style: GoogleFonts.righteous(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFC43021),
            ),
          ), // VIETNAM
          TextSpan(
            text: ' KOREA ',
            style: GoogleFonts.righteous(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFF7961E),
            ),
          ), // KOREA
          TextSpan(
            text: ' UNIVERSITY',
            style: GoogleFonts.righteous(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF374F8A),
            ),
          ), //UNIVERSITY
        ],
      ),
    ),
  );
}

Widget logoTextWidget({double fontSize = 14}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'V ',
            style: GoogleFonts.righteous(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFC43021),
            ),
          ), // V
          TextSpan(
            text: 'K ',
            style: GoogleFonts.righteous(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFF7961E),
            ),
          ), // K
          TextSpan(
            text: 'U',
            style: GoogleFonts.righteous(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF374F8A),
            ),
          ), // U
        ],
      ),
    ),
  );
}