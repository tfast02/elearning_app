import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/views/students/credits/register_credit.dart';
import 'package:vku_app/views/students/credits/learning_progress.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Credits'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const RegisterCredit());
              },
              child: boxTitleWidget(text: 'Register for credit'),
            ),

            const SizedBox(height: 24,),
            GestureDetector(
              onTap: () {
                Get.to(() => const LearningProgress());
              },
              child: boxTitleWidget(text: 'Learning progress'),
            ),
          ],
        ),
      ),
    );
  }
}
