import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:vku_app/controller/subject_controller.dart';
import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/views/students/subjects/subject_detail_screen.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  void initState() {
    super.initState();
    subjectController.getSemester();
    subjectController.getSubjectOfSemester();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Subjects'),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(20),
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              text127Widget(
                text: 'Semester: ${subjectController.semesterCode.value}',
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: subjectController.subjectList.length,
                itemBuilder: (context, index) {
                  var subject = subjectController.subjectList[index];
                  List<dynamic> sections = subject['sections'];
                  String sectionsString = sections.join(', ');
                  return GestureDetector(
                    onTap: () {
                      subjectController.sectionId.value = subject['section_id'];
                      Get.to(() => const SubjectDetailScreen());
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
