import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:vku_app/controller/outcome_controller.dart';
import 'package:vku_app/controller/subject_controller.dart';
import 'package:vku_app/views/teachers/score/teacher_score_detail.dart';
import 'package:vku_app/views/teachers/subject/teacher_subject_detail_screen.dart';
import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/views/students/subjects/subject_detail_screen.dart';

class TeacherScoreScreen extends StatefulWidget {
  const TeacherScoreScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScoreScreen> createState() => _TeacherScoreScreen();
}

class _TeacherScoreScreen extends State<TeacherScoreScreen> {
  final SubjectController subjectController = Get.put(SubjectController());
  final OutcomeController outcomeController = Get.put(OutcomeController());

  @override
  void initState() {
    super.initState();
    subjectController.getSemester();
    subjectController.getSubjectSemesterTeacher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Score'),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(20),
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              text127Widget(
                text: 'Danh sách các môn học giảng dạy',
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: subjectController.subjectSemesterTeacher.length,
                itemBuilder: (context, index) {
                  var subject = subjectController.subjectSemesterTeacher[index];
                  List<dynamic> sections = subject['sections'];
                  String sectionsString = sections.join(', ');
                  return GestureDetector(
                    onTap: () {
                      outcomeController.subjectId.value = subject['id'];
                      Get.to(() => const TeacherScoreDetail());
                    },
                    child: boxSubjectWidget(
                      textSubject: subject['name'],
                      textRoom: subject['room'] + ' _ ' + sectionsString,
                    ),
                  );
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
