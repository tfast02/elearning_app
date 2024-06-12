import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/logo_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/views/students/home_screen.dart';
import 'package:vku_app/views/students/option_screen.dart';
import 'package:vku_app/views/students/schedule_screen.dart';
import 'package:vku_app/views/students/tuition/tuition_paid_screen.dart';
import 'package:vku_app/views/students/tuition/upcoming_tuition_screen.dart';

class TuitionScreen extends StatefulWidget {
  const TuitionScreen({super.key});

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Get.to(() => const HomeScreen());
        break;
      case 1:
        Get.to(() => const ScheduleScreen());
        break;
      case 3:
        Get.to(() => const OptionScreen());
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: logoTextWidget(fontSize: 28)),

              const SizedBox(height: 16,),
              text64Widget(text: 'Tuition', fontSize: 24,),

              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Get.to(() => const TuitionPaidScreen());
                },
                child: boxTitleWidget(text: 'Tuition paid'),
              ),

              GestureDetector(
                onTap: () {
                  Get.to(() => const UpcomingTuitionScreen());
                },
                child: boxTitleWidget(text: 'Upcoming tuition'),
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
