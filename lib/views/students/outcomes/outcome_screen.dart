import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/outcome_controller.dart';
import 'package:vku_app/views/students/outcomes/outcome_detail_screen.dart';

class OutcomeScreen extends StatefulWidget {
  const OutcomeScreen({Key? key}) : super(key: key);

  @override
  State<OutcomeScreen> createState() => _OutcomeScreenState();
}

class _OutcomeScreenState extends State<OutcomeScreen> {
  Map<String, dynamic>? scoreDetail;

  @override
  void initState() {
    super.initState();
    outcomeController.getScore();
  }

  final OutcomeController outcomeController = Get.put(OutcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Course score'),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [

              // Line
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  height: 1,
                  color: const Color.fromRGBO(225, 241, 245, 1),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              // Semester 2 , 2022 - 2023
              const SizedBox(height: 16,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(79, 160, 171, 0.25),
                      blurRadius: 15,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text64Widget(
                            text: 'Semester 2 , 2022 - 2023',
                            fontSize: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '3.0',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(86, 78, 177, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Good',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(86, 78, 177, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Line
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  height: 1,
                  color: const Color.fromRGBO(225, 241, 245, 1),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              const  SizedBox(height: 40,),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: outcomeController.scoretList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      var scoreDetail = await outcomeController.getScoreDetail(
                          outcomeController.scoretList[index]['id']
                      );
                      Get.to(() => OutcomeDetailScreen(
                        scoreDetail: scoreDetail,
                        subjectName: outcomeController.scoretList[index]['name'],
                        letterScore: outcomeController.scoretList[index]['sum_t4_score'],
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(79, 160, 171, 0.25),
                            blurRadius: 15,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 32, bottom: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text64Widget(
                                    text: outcomeController.scoretList[index]['name'],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  outcomeController.scoretList[index]['sum_t4_score'],
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: outcomeController.getColorForScore(
                                        outcomeController.scoretList[index]['sum_t4_score']
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
