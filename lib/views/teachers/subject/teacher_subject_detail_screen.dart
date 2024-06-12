import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/subject_controller.dart';

class TeacherSubjectDetail extends StatefulWidget {

  const TeacherSubjectDetail({Key? key}) : super(key: key);

  @override
  State<TeacherSubjectDetail> createState() => _TeacherSubjectDetail();
}

class _TeacherSubjectDetail extends State<TeacherSubjectDetail> {
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  void initState() {
    super.initState();
    subjectController.getSubjectInfoTeacher();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Subject Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
              Obx(() => Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjectController.subjectInfoTeacher.length,
                    itemBuilder: (context, index) {
                      var subject = subjectController.subjectInfoTeacher[index];
                      List<dynamic> date = subject['date'];
                      String dateString = date.join(', ');
                      List<dynamic> time = subject['time'];
                      String timeString = time.join(', ');
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Subject name
                          Text(
                            subject['title'],
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(79, 160, 171, 1),
                            ),
                          ),

                          // Teacher name
                          const SizedBox(height: 24,),
                          Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: 120,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(79, 160, 171, 1),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(79, 160, 171, 0.25),
                                          blurRadius: 15,
                                          offset: Offset(4, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Attendance',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: 120,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(79, 160, 171, 1),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(79, 160, 171, 0.25),
                                          blurRadius: 15,
                                          offset: Offset(4, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Management',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              // Box Week
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Week',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      subject['week'],
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(252, 100, 97, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Box Room
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Room',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      subject['room'],
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(79, 160, 171, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              // Box Date
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Date',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      dateString,
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(86, 78, 177, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Box Lessons
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Lessons',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      timeString,
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(249, 136, 204, 1),
                                      ),
                                    ),
                                  ],
                                ),
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
                      );
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
