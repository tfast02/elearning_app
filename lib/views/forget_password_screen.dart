import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/logo_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/controller/auth_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreen();
}

class _ForgetPasswordScreen extends State<ForgetPasswordScreen> {
  int selectedRadio = 1;
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 251, 253, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              // VKU - VietNam Korea University
              const SizedBox(height: 66),
              logoWidget(),
              subLogoWidget(),

              // Title Forgot Password
              const SizedBox(height: 52),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: text64Widget(
                  text: 'Forgot Password',
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: text127Widget(text: 'Enter your Email.'),
              ),

              // Radio Button Student - Teacher
              const SizedBox(height: 52),
              Padding(
                padding: const EdgeInsets.only(left: 56, right: 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val!);
                        },
                        title: Text(
                          'Student',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: selectedRadio == 1 ? FontWeight.w500 : FontWeight.w400,
                            color: selectedRadio == 1 ? const Color(0xFF4FA0AB)
                                : const Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val!);
                        },
                        title: text127Widget(
                          text: 'Teacher',
                          fontWeight: selectedRadio == 2 ? FontWeight.w500 : FontWeight.w400,
                          color: selectedRadio == 2 ? const Color(0xFF4FA0AB)
                              : const Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Form Forgot Password
              const SizedBox(height: 52),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    // Email
                    Text(
                      'Email',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4FA0AB),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                    ),

                    // Button Continue
                    const SizedBox(height: 52),
                    Obx(() => ElevatedButton(
                      onPressed: authController.isLoading.value
                          ? null
                          : () => authController.checkEmail(
                        emailController.text.trim(),
                        selectedRadio,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF4FA0AB)),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(horizontal: 124, vertical: 24), // Tăng giá trị padding
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: const Text('Continue'),
                    )),
                  ],
                ),
              ),
              
            //   Back Button
              const SizedBox(height: 44),
              Padding(
                padding: const EdgeInsets.only(left: 165),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE1F1F5),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFFF5FBFD),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
