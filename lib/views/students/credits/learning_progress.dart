import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';

class LearningProgress extends StatefulWidget {
  const LearningProgress({super.key});

  @override
  State<LearningProgress> createState() => _LearningProgressState();
}

class _LearningProgressState extends State<LearningProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Learning Progress'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              // Total credits to be completed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  text64Widget(text: 'Total credits to be completed: '),
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

              // Obligatory  and Elective
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  text64Widget(text: 'Obligatory: '),
                  Text(
                    '145',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(252, 100, 97, 1),
                    ),
                  ),
                  const SizedBox(width: 60,),
                  text64Widget(text: 'Elective: '),
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
              const SizedBox(height: 28,),
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
                    text: 'Learned',
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
                  text64Widget(
                    text: 'Not yet studied',
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),

              // Debt
              const SizedBox(height: 8,),
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(252, 100, 97, 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  text127Widget(
                    text: 'Debt',
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),

              // Compulsory course
              const SizedBox(height: 20,),
              text127Widget(
                text: 'Compulsory course',
                fontWeight: FontWeight.w500,
              ),

              // Tiếng anh 1
              const SizedBox(height: 16,),
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
                  padding: const EdgeInsets.only(top: 12, right: 20, bottom: 12,  left: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text64Widget(text: '1'),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  text127Widget(
                                    text: 'Tiếng Anh 1',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Text(
                                    'A',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(79, 160, 171, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(79, 160, 171, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      // Semester and Credit
                      const SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          text127Widget(
                            text: 'semester: 1',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(width: 12,),
                          text127Widget(
                            text: 'credits: ',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          Text(
                            '3',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(252, 120, 122, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Đảm bảo chất lượng và kiểm thử phần mềm
              const SizedBox(height: 20,),
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
                  padding: const EdgeInsets.only(top: 12, right: 20, bottom: 12,  left: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text64Widget(text: '2'),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  text127Widget(
                                    text: 'Đảm bảo chất lượng và kiểm thử phần mềm',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Text(
                                    'F',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(252, 100, 97, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(252, 100, 97, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      // Semester and Credit
                      const SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          text127Widget(
                            text: 'semester: 1',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(width: 12,),
                          text127Widget(
                            text: 'credits: ',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          Text(
                            '3',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(252, 120, 122, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Đảm bảo chất lượng và kiểm thử phần mềm
              const SizedBox(height: 20,),
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
                  padding: const EdgeInsets.only(top: 12, right: 20, bottom: 12,  left: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text64Widget(text: '3'),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  text127Widget(
                                    text: 'Đảm bảo chất lượng và kiểm thử phần mềm',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Text(
                                    'F',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(252, 100, 97, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(252, 100, 97, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      // Semester and Credit
                      const SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          text127Widget(
                            text: 'semester: 1',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(width: 12,),
                          text127Widget(
                            text: 'credits: ',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          Text(
                            '3',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(252, 120, 122, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Total credits
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: text64Widget(text: 'Total credits:'),
                  ),
                  Text(
                    '8',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(79, 160, 171, 1),
                    ),
                  ),
                  const SizedBox(width: 16,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
