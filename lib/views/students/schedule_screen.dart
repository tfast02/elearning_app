import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/logo_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/views/students/home_screen.dart';
import 'package:vku_app/views/students/option_screen.dart';
import 'package:vku_app/controller/subject_controller.dart';
import 'package:vku_app/views/students/tuition_screen.dart';
import 'package:vku_app/views/students/subjects/subject_detail_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final SubjectController subjectController = Get.put(SubjectController());
  int _selectedIndexNav = 1;
  DateTime _selectedDate = DateTime.now();
  int _selectedIndexDate = DateTime.now().weekday - 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexNav = index;
    });
    switch (index) {
      case 0:
        Get.to(() => const HomeScreen());
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

  void _updateSelectedDate(int dayIndex) {
    setState(() {
      DateTime today = DateTime.now();
      DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
      DateTime selectedDay = startOfWeek.add(Duration(days: dayIndex));

      _selectedDate = selectedDay;
      _selectedIndexDate = dayIndex;
    });
    subjectController.getSubjectSchedule(dayIndex);
  }

  @override
  void initState() {
    super.initState();
    subjectController.getSubjectSchedule(_selectedIndexDate);
    subjectController.getSubjectOfSemester();
  }

  @override
  Widget build(BuildContext context) {
    List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: logoTextWidget(fontSize: 28)),
                  const SizedBox(height: 16,),
                  Text(
                    'Your Schedule',
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(79, 160, 171, 1),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 7; i++)
                              GestureDetector(
                                onTap: () => _updateSelectedDate(i),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 44,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: _selectedIndexDate == i ? const Color.fromRGBO(79, 160, 171, 1) : null,
                                        border: Border.all(
                                          width: 1,
                                          color: _selectedIndexDate == i ? const Color.fromRGBO(79, 160, 171, 1)
                                              : const Color.fromRGBO(191, 191, 191, 1),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Column(
                                          children: [
                                            text127Widget(
                                              text: weekdays[i],
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: _selectedIndexDate == i ? Colors.white
                                                  : const Color.fromRGBO(127, 127, 127, 1),
                                            ),
                                            const SizedBox(height: 4,),
                                            text64Widget(
                                              text: DateFormat('dd').format(DateTime.now()
                                                  .subtract(Duration(days: DateTime.now()
                                                  .weekday - 1)).add(Duration(days: i))),
                                              color: _selectedIndexDate == i ? Colors.white
                                                  : const Color.fromRGBO(64, 64, 64, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40,),
                  text127Widget(
                    text: 'Schedule _ ${DateFormat('E - dd/MM').format(_selectedDate)}',
                    fontWeight: FontWeight.w500,
                  ),

                  const SizedBox(height: 20,),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjectController.subjectListSchedule.value.length,
                    itemBuilder: (context, index) {
                      var subject = subjectController.subjectListSchedule.value[index];
                      String name = subject['name'];
                      String room = subject['room'];
                      String time = subject['time'];

                      return GestureDetector(
                        onTap: () {
                          Get.to(
                                () => const SubjectDetailScreen(),
                            arguments: subjectController.subjectList[index],
                          );
                        },
                        child: boxSubjectWidget(
                          textSubject: name,
                          textRoom: '$room _ $time',
                        ),
                      );
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 36,
        elevation: 0,
        onTap: _onItemTapped,
        currentIndex: _selectedIndexNav,
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