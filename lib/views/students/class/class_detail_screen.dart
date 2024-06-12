import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/subject_controller.dart';

class ClassDetailScreen extends StatefulWidget {
  const ClassDetailScreen({super.key});

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> {
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  void initState() {
    super.initState();
    subjectController.getSemester();
    subjectController.getProjectInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Project class'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
              Obx(() => Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjectController.projectInfoList.length,
                    itemBuilder: (context, index) {
                      var project = subjectController.projectInfoList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Class name
                          Text(
                            subjectController.projectTitle.value,
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(79, 160, 171, 1),
                            ),
                          ),

                          // Teacher name
                          const SizedBox(height: 24,),
                          text127Widget(
                            text: project['name']?.toString() ?? '',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),

                          // Phone
                          const SizedBox(height: 16,),
                          Row(
                            children: [
                              const Icon(
                                Icons.call_outlined,
                                size: 20,
                                color: Color.fromRGBO(127, 127, 127, 1),
                              ),
                              const SizedBox(width: 16),
                              text127Widget(text: '0${project['phone']?.toString() ?? ''}'),
                            ],
                          ),

                          // Mail
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              const Icon(
                                Icons.mail_outlined,
                                size: 20,
                                color: Color.fromRGBO(127, 127, 127, 1),
                              ),
                              const SizedBox(width: 16),
                              text127Widget(text: project['email']?.toString() ?? ''),
                            ],
                          ),

                          // Member of group
                          const SizedBox(height: 30,),
                          text127Widget(text: 'Member of group:'),
                          const SizedBox(height: 8,),
                          Container(
                            width: double.infinity,
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
                              padding: const EdgeInsets.only(top: 12, right: 20, bottom: 12, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text Title
                                  text64Widget(
                                    text: project['title']?.toString() ?? '',
                                  ),

                                  // Line
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Container(
                                      height: 1,
                                      color: const Color.fromRGBO(225, 241, 245, 1),
                                      margin: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                  ),

                                  // Xác nhận đề cương chi tiết
                                  const SizedBox(height: 16,),
                                  Text(
                                    '- Xác nhận đề cương chi tiết:',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(79, 160, 171, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(129, 130, 147, 1),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 28, right: 28),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            project['start'],
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Nộp kết quả thực hiện đề tài
                                  const SizedBox(height: 16,),
                                  Text(
                                    '- Nộp kết quả thực hiện đề tài:',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(79, 160, 171, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(129, 130, 147, 1),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 28, right: 28),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            project['end'],
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Submit detailed outline
                                  const SizedBox(height: 40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: text64Widget(
                                          text: 'Nộp đề cương chi tiết',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: project['topic'] == 1
                                              ? const Color.fromRGBO(79, 160, 171, 1)
                                              : const Color.fromRGBO(191, 191, 191, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 16,),
                                    ],
                                  ),

                                  // Instructor confirms
                                  const SizedBox(height: 16,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: text64Widget(
                                          text: 'GVHD xác nhận',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: project['confirm'] == 1
                                              ? const Color.fromRGBO(79, 160, 171, 1)
                                              : const Color.fromRGBO(191, 191, 191, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 16,),
                                    ],
                                  ),

                                  // Submit results of project
                                  const SizedBox(height: 16,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: text64Widget(
                                          text: 'Nộp kết quả thực hiện đề tài',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: project['report'] == 1
                                              ? const Color.fromRGBO(79, 160, 171, 1)
                                              : const Color.fromRGBO(191, 191, 191, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 16,),
                                    ],
                                  ),

                                  // Permission to defend project
                                  const SizedBox(height: 16,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: text64Widget(
                                          text: 'Được phép bảo vệ đề tài',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: project['status'] == 1
                                              ? const Color.fromRGBO(79, 160, 171, 1)
                                              : const Color.fromRGBO(191, 191, 191, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 16,),
                                    ],
                                  ),

                                  // Instruction Point
                                  const SizedBox(height: 16,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: text64Widget(
                                          text: 'Điểm hướng dẫn',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        project['diligence_score']?.toString() ?? '',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(252, 120, 122, 1),
                                        ),
                                      ),
                                      const SizedBox(width: 16,),
                                    ],
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ],
                      );
                    },
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
