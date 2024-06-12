import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/widgets/logo_widget.dart';

Widget boxTitleWidget({required String text}) {
  return Container(
    height: 58,
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(79, 160, 171, 0.25),
          blurRadius: 15,
          offset: Offset(4, 4),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // VKU Text
        logoTextWidget(),

        // Text Class
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(79, 160, 171, 1),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Icon arrow_forward_ios
        const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color.fromRGBO(79, 160, 171, 1),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget boxSubjectWidget({required String textSubject, textRoom}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(79, 160, 171, 0.25),
          blurRadius: 15,
          offset: Offset(4, 4),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // VKU Text
        logoTextWidget(),

        // Text Class
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textSubject,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(79, 160, 171, 1),
                  ),
                ),
                Text(
                  textRoom,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(79, 160, 171, 1),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Icon arrow_forward_ios
        const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color.fromRGBO(79, 160, 171, 1),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}