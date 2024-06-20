import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/logo_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/controller/auth_controller.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  final int role;
  const OTPScreen({Key? key, required this.email, required this.role}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreen();
}

class _OTPScreen extends State<OTPScreen> {
  final AuthController authController = Get.put(AuthController());
  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.sendOTP(widget.email, widget.role);
    });
  }

  String getOTP() {
    return otpControllers.map((controller) => controller.text).join();
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

              // Title Enter OTP
              const SizedBox(height: 52),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: text64Widget(
                  text: 'Enter OTP',
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 48),
                child: text127Widget(
                  text: 'Please enter the 6-digit OTP code sent to your email'
                ),
              ),

              // Form OTP
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    // Enter OTP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        text127Widget(text: '120s'),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 44,
                          height: 44,
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(191, 191, 191, 0.5),
                            child: TextField(
                              controller: otpControllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                                style: const TextStyle(fontSize: 24)
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Resend Code
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                          children: <TextSpan> [
                            TextSpan(
                              text: 'You have not received OTP yet? ',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF7F7F7F),
                              ),
                            ),
                            TextSpan(
                              text: 'Resend code',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF4FA0AB),
                              ),
                            ),
                          ]
                      ),
                    ),

                    const SizedBox(height: 52),
                    Obx(() => ElevatedButton(
                      onPressed: authController.isLoading.value ? null : () {
                        String otp = getOTP();
                        authController.verifyOTP(widget.email, otp, widget.role);
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
                          const EdgeInsets.symmetric(horizontal: 124, vertical: 24),
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
