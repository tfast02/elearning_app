import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:vku_app/controller/subject_controller.dart';
import 'package:vku_app/widgets/box_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/views/students/class/class_detail_screen.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  void initState() {
    super.initState();
    subjectController.getSemester();
    subjectController.getProjectTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Class'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            Obx(() => Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjectController.projectList.length,
                    itemBuilder: (context, index) {
                      var project = subjectController.projectList[index];
                      return GestureDetector(
                        onTap: () {
                          subjectController.projectId.value = project['id'];
                          subjectController.projectTitle.value = project['title'];
                          Get.to(() => const ClassDetailScreen());
                        },
                        child: boxTitleWidget(
                            text: project['title'],
                        ),
                      );
                    }
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
