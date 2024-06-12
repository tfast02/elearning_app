import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget? appBarWidget({required String text}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 68,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: const Color.fromRGBO(64, 64, 64, 1),
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    ),
    iconTheme: const IconThemeData(
      size: 20,
      color: Color.fromRGBO(64, 64, 64, 1),
    ),
  );
}