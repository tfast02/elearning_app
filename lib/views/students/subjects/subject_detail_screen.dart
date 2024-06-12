import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';

class SubjectDetailScreen extends StatefulWidget {

  const SubjectDetailScreen({Key? key}) : super(key: key);

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final subject = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Subject Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              // Subject name
              Text(
                subject['name'],
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(79, 160, 171, 1),
                ),
              ),

              // Teacher name
              const SizedBox(height: 24,),
              text127Widget(
                text: subject['teacher'],
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Box Week
                  boxDetailWidget(
                    title: 'Week',
                    text: subject['week'],
                    colorText: const Color.fromRGBO(252, 100, 97, 1),
                  ),

                  // Box Room
                  boxDetailWidget(
                    title: 'Room',
                    text: subject['room'],
                    colorText: const Color.fromRGBO(79, 160, 171, 1),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Box Date
                  boxDetailWidget(
                    title: 'Date',
                    text: 'Thu',
                    colorText: const Color.fromRGBO(86, 78, 177, 1),
                  ),

                  // Box Lessons
                  boxDetailWidget(
                    title: 'Lessons',
                    text: '1 -> 2',
                    colorText: const Color.fromRGBO(249, 136, 204, 1),
                  ),
                ],
              ),

              const SizedBox(height: 32,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(79, 160, 171, 0.25),
                      blurRadius: 16,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Text Title
                      Center(
                        child: text64Widget(
                          text: 'Session 1',
                          fontSize: 12,
                        ),
                      ),

                      // Chapter
                      const SizedBox(height: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chapter 1. Introduction',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(79, 160, 171, 1),
                            ),
                          ),
                          const SizedBox(height: 4,),
                          text127Widget(
                            text: '2023-08-14 07:46:08',
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),

                      // Absent
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text127Widget(
                            text: 'Absent: 1',
                            fontSize: 14,
                          ),
                          const SizedBox(height: 16,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: text127Widget(text: 'Ngo Thanh Phat - 20IT449'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(79, 160, 171, 0.25),
                      blurRadius: 16,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Text Title
                      Center(
                        child: text64Widget(
                          text: 'Session 1',
                          fontSize: 12,
                        ),
                      ),

                      // Chapter
                      const SizedBox(height: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chapter 1. Introduction',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(79, 160, 171, 1),
                            ),
                          ),
                          const SizedBox(height: 4,),
                          text127Widget(
                            text: '2023-08-14 07:46:08',
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget boxDetailWidget({required String title, required String text, required Color colorText}) {
  return Container(
    width: 160,
    height: 84,
    padding: const EdgeInsets.only(top: 20, left: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text127Widget(
          text: title,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 12,),
        Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: colorText,
          ),
        ),
      ],
    ),
  );
}
