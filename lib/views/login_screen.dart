import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/logo_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/controller/auth_controller.dart';
import 'package:vku_app/views/forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedRadio = 1;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  final AuthController authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 251, 253, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // VKU - VietNam Korea University
              const SizedBox(height: 66),
              logoWidget(),
              subLogoWidget(),

              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Title Sign In
                    const SizedBox(height: 52),
                    text64Widget(text: 'Sign In', fontSize: 20),

                    const SizedBox(height: 10),
                    text127Widget(text: 'Hi there! Nice to meet you again.'),

                    // Radio Button Student - Teacher
                    const SizedBox(height: 52),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
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
                              title: text127Widget(
                                text: 'Student',
                                fontWeight: selectedRadio == 1 ? FontWeight.w500 : FontWeight.w400,
                                color: selectedRadio == 1 ? const Color(0xFF4FA0AB)
                                    : const Color.fromRGBO(127, 127, 127, 1),
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

                    // Form login
                    const SizedBox(height: 52),
                    Column(
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
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                          ),
                        ),

                        // Password
                        const SizedBox(height: 20),
                        Text(
                          'Password',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF4FA0AB),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {
                                // Your action when the eye icon is pressed
                              },
                            ),
                          ),
                        ),

                        // Forgot password
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const ForgetPasswordScreen());
                          },
                          child: text127Widget(
                            text: 'Forgot Password?',
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // Button SignIn
                        const SizedBox(height: 52),
                        ElevatedButton(
                          onPressed: () => authController.login(_emailController, _passwordController, selectedRadio),
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
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
