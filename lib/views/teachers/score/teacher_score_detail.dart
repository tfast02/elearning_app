import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/controller/outcome_controller.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/widgets/text_widget.dart';

class TeacherScoreDetail extends StatefulWidget {
  const TeacherScoreDetail({Key? key}) : super(key: key);

  @override
  State<TeacherScoreDetail> createState() => _TeacherScoreDetailState();
}

class _TeacherScoreDetailState extends State<TeacherScoreDetail> {

  final OutcomeController outcomeController = Get.put(OutcomeController());

  @override
  void initState() {
    super.initState();
    outcomeController.getScoreTeacher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Score Detail'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(() => Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: outcomeController.scoreList.length,
                  itemBuilder: (context, index) {
                    var score = outcomeController.scoreList[index];
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                text64Widget(text: (index + 1).toString()),
                                const SizedBox(width: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        score['name'],
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(79, 160, 171, 1),
                                        ),
                                      ),
                                      const SizedBox(height: 4,),
                                      text127Widget(
                                        text: '${score['code']} - ${score['class']}',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Semester and Credit
                            const SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                text127Widget(
                                  text: 'Điểm T10: ',
                                  fontWeight: FontWeight.w500,
                                ),
                                Text(
                                  score['sum_t10_score'].toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(252, 120, 122, 1),
                                  ),
                                ),
                                const SizedBox(width: 24,),
                                text127Widget(
                                  text: 'Điểm chữ: ',
                                  fontWeight: FontWeight.w500,
                                ),
                                Text(
                                  score['sum_t4_score'],
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(252, 120, 122, 1),
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
        ),
      ),
    );
  }
}
