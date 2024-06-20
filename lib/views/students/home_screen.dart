import 'dart:core';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/controller/auth_controller.dart';
import 'package:vku_app/controller/subject_controller.dart';
import 'package:vku_app/views/students/subjects/subject_detail_screen.dart';

import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/views/students/option_screen.dart';
import 'package:vku_app/views/students/schedule_screen.dart';
import 'package:vku_app/views/students/tuition_screen.dart';
import 'package:vku_app/views/students/class/class_screen.dart';
import 'package:vku_app/views/students/notifications_creen.dart';
import 'package:vku_app/views/students/credits/credit_screen.dart';
import 'package:vku_app/views/students/outcomes/outcome_screen.dart';
import 'package:vku_app/views/students/subjects/subject_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  void initState() {
    super.initState();
    subjectController.getSubjectOfDay();
    subjectController.getSemester();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
        Get.to(() => const ScheduleScreen());
        break;
      case 2:
        Get.to(() => const TuitionScreen());
        break;
      case 3:
        Get.to(() => const OptionScreen());
        break;
      default:
    }
  }

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Map<String, String> dateTime = subjectController.getDateTime();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(245, 251, 253, 1),
              child: Padding(
                padding: const EdgeInsets.only(top: 80, right: 24, bottom: 48, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // Text Title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text64Widget(
                                text: 'Hi, ${authController.name}',
                                fontSize: 24,
                              ),
                              const SizedBox(height: 12,),
                              text127Widget(text: 'Here is your activity today,'),
                            ],
                          ),

                          // Notification Icons
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const NotificationsScreen());
                            },
                            child: Stack(
                              children: [
                                const Icon(
                                  Icons.notifications_none,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: text64Widget(
                                        text: '1',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // Box GPA
                        boxOverview(
                          number: '3.0',
                          text: 'GPA',
                          colorNumber: const Color.fromRGBO(252, 100, 97, 1),
                        ),

                        // Box Total Credit
                        boxOverview(
                          number: '120',
                          text: 'Total Credit',
                          colorNumber: const Color.fromRGBO(79, 160, 171, 1),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Box Assignments
                        boxOverview(
                          number: '0',
                          text: 'Assignments',
                          colorNumber: const Color.fromRGBO(86, 78, 177, 1),
                        ),

                        // Box Total Subject
                        boxOverview(
                          number: '15',
                          text: 'Total Subject',
                          colorNumber: const Color.fromRGBO(249, 136, 204, 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // Class
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const ClassScreen());
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(252, 100, 97, 1),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.school_outlined,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              text127Widget(
                                text: 'Class',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),

                        // Subjects
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SubjectScreen());
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(79, 160, 171, 1),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.subtitles_outlined,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              text127Widget(
                                text: 'Subjects',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),

                        // Credit
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const CreditScreen());
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(86, 78, 177, 1),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.add_card,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              text127Widget(
                                text: 'Credit',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),

                        // Outcomes
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const OutcomeScreen());
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 136, 204, 1),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.credit_score,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              text127Widget(
                                text: 'Outcomes',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36,),
                    text64Widget(
                      text: 'Schedule _ ${dateTime['weekdayName']} - '
                          '${dateTime['day']}/${dateTime['month']}',
                      fontSize: 20,
                    ),

                    const SizedBox(height: 24,),
                    Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: subjectController.subjectListOfDay.length,
                      itemBuilder: (context, index) {
                        var subject = subjectController.subjectListOfDay[index];
                        return GestureDetector(
                          onTap: () {
                            subjectController.sectionId.value = subject['id'];
                            Get.to(() => const SubjectDetailScreen());
                          },
                          child: boxSubjectWidget(
                            textSubject: subject['name'],
                            textRoom: '${subject['room']} _ ${subject['time']}',
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 36,
        elevation: 0,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(79, 160, 171, 1),
        unselectedItemColor: const Color(0xFFBFBFBF),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

Widget boxOverview({required String number, required String text, required Color colorNumber}) {
  return Container(
    width: 160,
    height: 84,
    padding: const EdgeInsets.only(top: 16, left: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(79, 160, 171, 0.25),
          blurRadius: 16,
          offset: Offset(4, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: colorNumber,
          ),
        ),
        const SizedBox(height: 12,),
        text127Widget(
          text: text,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}
