import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/controller/subject_controller.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';

class SubjectDetailScreen extends StatefulWidget {

  const SubjectDetailScreen({Key? key}) : super(key: key);

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  void initState() {
    super.initState();
    subjectController.getSubjectInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Subject Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
              Obx(() => Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjectController.subjectInfo.length,
                    itemBuilder: (context, index) {
                      var subject = subjectController.subjectInfo[index];
                      List<dynamic> date = subject['date'];
                      String dateString = date.join(', ');
                      List<dynamic> time = subject['time'];
                      String timeString = time.join(', ');
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Subject name
                          Text(
                            subject['title'],
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(79, 160, 171, 1),
                            ),
                          ),

                          // Teacher name
                          const SizedBox(height: 24,),
                         text127Widget(
                           text: subject['name'],
                           fontWeight: FontWeight.w500,
                         ),

                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              // Box Week
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Week',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      subject['week'],
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(252, 100, 97, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Box Room
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Room',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      subject['room'],
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(79, 160, 171, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              // Box Date
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Date',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      dateString,
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(86, 78, 177, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Box Lessons
                              Container(
                                width: 160,
                                height: 84,
                                padding: const EdgeInsets.only(top: 20, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text127Widget(
                                      text: 'Lessons',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(
                                      timeString,
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(249, 136, 204, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32,),
                        ],
                      );
                    },
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjectController.subjectInfoContent.length,
                    itemBuilder: (context, index) {
                      var content = subjectController.subjectInfoContent[index];
                      List<dynamic> absent = content['absent'];
                      Set<dynamic> uniqueAbsentSet = absent.toSet(); // Lọc các giá trị duy nhất
                      List<dynamic> uniqueAbsent = uniqueAbsentSet.toList(); // Chuyển đổi thành danh sách
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20),
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
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text Title
                              Center(
                                child: text64Widget(
                                  text: 'Session ${(index + 1).toString()}',
                                  fontSize: 12,
                                ),
                              ),

                              // Chapter
                              const SizedBox(height: 12,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    content['content']?.toString()
                                        ?? 'Giảng viên chưa nhập nội dung',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(79, 160, 171, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  text127Widget(
                                    text: content['time']?.toString() ?? '',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 12,),
                                  text127Widget(text: 'Absent:'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: uniqueAbsent.map((name) => text127Widget(
                                        text: name,
                                      )).toList(),
                                    ),
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
