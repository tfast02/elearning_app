import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/logo_widget.dart';

import 'package:vku_app/controller/auth_controller.dart';

import 'package:vku_app/views/chat_bot_screen.dart';
import 'package:vku_app/views/teachers/teacher_home_screen.dart';
import 'package:vku_app/views/teachers/teacher_schedule_screen.dart';

class TeacherOptionScreen extends StatefulWidget {
  const TeacherOptionScreen({super.key});

  @override
  State<TeacherOptionScreen> createState() => _TeacherOptionScreen();
}

class _TeacherOptionScreen extends State<TeacherOptionScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Get.to(() => const TeacherHomeScreen());
        break;
      case 1:
        Get.to(() => const TeacherScheduleScreen());
        break;
      default:
    }
  }

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 24, left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: logoTextWidget(fontSize: 28)),

              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  height: 1,
                  color: const Color.fromRGBO(225, 241, 245, 1),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/user.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(79, 160, 171, 1),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        authController.nameTeacher,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(79, 160, 171, 1),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  height: 1,
                  color: const Color.fromRGBO(225, 241, 245, 1),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              const SizedBox(height: 52,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.folder_shared_outlined,
                    size: 32,
                    color: Color.fromRGBO(79, 160, 171, 1),
                  ),
                  const SizedBox(width: 24,),
                  titleOptionWidget(title: 'Profile'),
                  iconArrowWidget(),
                ],
              ),
              const SizedBox(height: 32,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 32,
                    color: Color.fromRGBO(79, 160, 171, 1),
                  ),
                  const SizedBox(width: 24,),
                  titleOptionWidget(title: 'Account'),
                  iconArrowWidget(),
                ],
              ),
              const SizedBox(height: 32,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.settings_outlined,
                    size: 32,
                    color: Color.fromRGBO(79, 160, 171, 1),
                  ),
                  const SizedBox(width: 24,),
                  titleOptionWidget(title: 'Setting'),
                  iconArrowWidget(),
                ],
              ),
              const SizedBox(height: 32,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.help_outline,
                    size: 32,
                    color: Color.fromRGBO(79, 160, 171, 1),
                  ),
                  const SizedBox(width: 24,),
                  titleOptionWidget(title: 'About'),
                  iconArrowWidget(),
                ],
              ),
              const SizedBox(height: 32,),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ChatBotScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.message_outlined,
                      size: 32,
                      color: Color.fromRGBO(79, 160, 171, 1),
                    ),
                    const SizedBox(width: 24,),
                    titleOptionWidget(title: 'Chat AI'),
                    iconArrowWidget(),
                  ],
                ),
              ),

              const SizedBox(height: 52,),
              ElevatedButton(
                onPressed: (){
                  authController.logout();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF4FA0AB)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 134, vertical: 24), // Tăng giá trị padding
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Text('Sign Out'),
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

Widget titleOptionWidget({required String title}) {
  return Text(
    title,
    style: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(79, 160, 171, 1),
    ),
  );
}

Widget iconArrowWidget() {
  return const Expanded(
    child: Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color.fromRGBO(79, 160, 171, 1),
          ),
        ],
      ),
    ),
  );
}