import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/logo_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';

import 'package:vku_app/controller/auth_controller.dart';
import 'package:vku_app/controller/subject_controller.dart';

import 'package:vku_app/views/teachers/teacher_option_screen.dart';
import 'package:vku_app/views/teachers/teacher_schedule_screen.dart';
import 'package:vku_app/views/teachers/subject/teacher_subject_screen.dart';
import 'package:vku_app/views/teachers/subject/teacher_subject_detail_screen.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  int _selectedIndex = 0;
  final AuthController authController = Get.put(AuthController());
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  void initState() {
    super.initState();
    subjectController.getSubjectOfDayTeacher();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
        Get.to(() => const TeacherScheduleScreen());
        break;
      case 2:
        Get.to(() => const TeacherOptionScreen());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> dateTime = subjectController.getDateTime();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 24, left: 24),
          child: Column(
            children: [
              Container(
                height: 162,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(225, 241, 245, 1),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // Text Title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text64Widget(
                                text: 'Hi, ${authController.teacherName}',
                                fontSize: 24,
                              ),
                              const SizedBox(height: 12,),
                              text127Widget(text: 'Here is your activity today,'),
                            ],
                          ),

                          // Notification Icons
                          GestureDetector(
                            onTap: () {

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
                    const SizedBox(height: 16,),
                    Center(
                      child: logoTextWidget(),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 44,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // Class
                      GestureDetector(
                        onTap: () {

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
                          Get.to(() => const TeacherSubjectScreen());
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

                  Column(
                    children: [
                      Obx(() => Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: subjectController.subjectScheduleTeacher.value.length,
                            itemBuilder: (context, index) {
                              var subject = subjectController.subjectScheduleTeacher.value[index];
                              return GestureDetector(
                                onTap: () {
                                  subjectController.subjectId.value = subject['id'];
                                  Get.to(() => const TeacherSubjectDetail());
                                },
                                child: boxSubjectWidget(
                                  textSubject: subject['name'],
                                  textRoom: '${subject['room']} _ ${subject['time']}',
                                ),
                              );
                            }
                          )
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
