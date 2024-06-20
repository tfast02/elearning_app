import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/controller/credit_controller.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/subject_controller.dart';

class LearningProgress extends StatefulWidget {
  const LearningProgress({super.key});

  @override
  State<LearningProgress> createState() => _LearningProgressState();
}

class _LearningProgressState extends State<LearningProgress> {
  final CreditController creditController = Get.put(CreditController());

  @override
  void initState() {
    super.initState();
    creditController.learningProgress();
  }

  Color getLetterGradeColor(String? grade) {
    switch (grade) {
      case 'A':
        return const Color(0xFF008000);
      case 'B':
        return const Color(0xFF0000FF);
      case 'C':
        return const Color(0xFF73879C);
      case 'D':
        return const Color(0xFFFFA500);
      default:
        return const Color(0xFFC7254E);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Tiến độ học tập'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
              Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Total credits to be completed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      text64Widget(text: 'Tổng tín chỉ cần hoàn thành: '),
                      Text(
                        '151',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(252, 120, 122, 1),
                        ),
                      ),
                    ],
                  ),

                  // Obligatory and Elective
                  const SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      text64Widget(text: 'Số TC bắt buộc: '),
                      Text(
                        '145',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(252, 100, 97, 1),
                        ),
                      ),
                      const SizedBox(width: 60,),
                      text64Widget(text: 'Số TC tự chọn: '),
                      Text(
                        '6',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(252, 100, 97, 1),
                        ),
                      ),
                    ],
                  ),

                  // Learned
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(79, 160, 171, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 16,),
                      text127Widget(
                        text: 'Đã học',
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),

                  // Not yet studied
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 187, 113, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 16,),
                      text127Widget(
                        text: 'Chưa học',
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),

                  // Compulsory course
                  const SizedBox(height: 20,),
                  text64Widget(text: 'Lộ trình học'),

                  const SizedBox(height: 16,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: creditController.progressList.length,
                    itemBuilder: (context, index) {
                      var progress = creditController.progressList[index];
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 24),
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
                          padding: const EdgeInsets.only(top: 12, right: 20, bottom: 12,  left: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text64Widget(text: (index + 1).toString()),
                                  const SizedBox(width: 20,),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          text127Widget(
                                            text: progress['name'],
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Text(
                                            progress['letter grades']?.toString() ?? '',
                                            style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: getLetterGradeColor(progress['letter grades']?.toString()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: progress['status'] == 0
                                          ? const Color.fromRGBO(255, 187, 113, 1)
                                          : const Color.fromRGBO(79, 160, 171, 1),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),

                              // Semester and Credit
                              const SizedBox(height: 12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text127Widget(
                                    text: progress['obligatory'] == 0
                                      ? 'HP Tự chọn' : 'HP Bắt buộc',
                                    fontSize: 12,
                                    color: progress['obligatory'] == 0
                                      ? const Color(0xFFC7254E)
                                      : const Color.fromRGBO(127, 127, 127, 1),
                                  ),
                                  const SizedBox(width: 120,),
                                  text127Widget(
                                    text: 'semester: ${progress['semester']}',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(width: 12,),
                                  text127Widget(
                                    text: 'credits: ${progress['credit'].toString()}',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
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
