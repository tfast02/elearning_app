import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/outcome_controller.dart';

class OutcomeDetailScreen extends StatefulWidget {
  final Map<String, dynamic> scoreDetail;
  final String subjectName;
  final String letterScore;

  const OutcomeDetailScreen({Key? key, required this.scoreDetail,
    required this.subjectName, required this.letterScore}) : super(key: key);

  @override
  State<OutcomeDetailScreen> createState() => _OutcomeDetailScreenState();
}

class _OutcomeDetailScreenState extends State<OutcomeDetailScreen> {

  final OutcomeController outcomeController = Get.put(OutcomeController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Detail Score'),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            children:  <Widget>[

              // Line
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  height: 1,
                  color: const Color.fromRGBO(225, 241, 245, 1),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),

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
                  padding: const EdgeInsets.only(top: 20, right: 32, bottom: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text64Widget(text: widget.subjectName),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.letterScore,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: outcomeController.getColorForScore(widget.letterScore)
                            ),
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

              // Detail Score
              const  SizedBox(height: 20,),
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
                child: Table(
                  border: const TableBorder(
                    horizontalInside: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(225, 241, 245, 1)
                    ),
                    verticalInside: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(225, 241, 245, 1)
                    ),
                  ),
                  children: [
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Credits'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(
                                text: widget.scoreDetail['credit'].toString()
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Study Times'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(
                                  text: widget.scoreDetail['session'].toString()
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Diligence'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(
                                  text: outcomeController.replaceNull(
                                      widget.scoreDetail['diligence'].toString()
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Exercise Mark'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(
                                  text: outcomeController.replaceNull(
                                      widget.scoreDetail['homework'].toString()
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Midterm Mark'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(
                                  text: outcomeController.replaceNull(
                                      widget.scoreDetail['midterm'].toString()
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Final Mark'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(
                                  text: outcomeController.replaceNull(
                                      widget.scoreDetail['final'].toString()
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Full Mark'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(
                                  text: outcomeController.replaceNull(
                                      widget.scoreDetail['full'].toString()
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                              child: text64Widget(text: 'Letter Mark'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 24),
                            child: Center(
                                child: Text(
                                  widget.letterScore,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: outcomeController.getColorForScore(widget.letterScore)
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
