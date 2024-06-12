import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/tuition_controller.dart';

class TuitionPaidScreen extends StatefulWidget {
  const TuitionPaidScreen({super.key});

  @override
  State<TuitionPaidScreen> createState() => _TuitionPaidScreenState();
}

class _TuitionPaidScreenState extends State<TuitionPaidScreen> {
  final TuitionController tuitionController = Get.put(TuitionController());

  @override
  void initState() {
    super.initState();
    tuitionController.getTuitionPaid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(text: 'Tuition paid'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: tuitionController.tuitionPaid.length,
                    itemBuilder: (context, index) {
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
                              Text(
                                tuitionController.tuitionPaid[index]['code'],
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(79, 160, 171, 1),
                                ),
                              ),
                              const SizedBox(height: 4,),
                              text127Widget(text: tuitionController.tuitionPaid[index]['date']),
                              const SizedBox(height: 12,),
                              text127Widget(
                                  text: 'Collector: ${tuitionController.tuitionPaid[index]['collector']}'
                              ),
                              const SizedBox(height: 12,),
                              text127Widget(
                                  text: 'Note: ${tuitionController.tuitionPaid[index]['description']}'
                              ),

                              const SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  text64Widget(text: tuitionController.formatNumber(
                                    tuitionController.tuitionPaid[index]['total'].toString()
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Total
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text64Widget(text: 'Total:', fontSize: 18),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            tuitionController.formatNumber(tuitionController.totalTuitionPaid.value),
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(79, 160, 171, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
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
