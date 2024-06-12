import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/tuition_controller.dart';

class UpcomingTuitionScreen extends StatefulWidget {
  const UpcomingTuitionScreen({super.key});

  @override
  State<UpcomingTuitionScreen> createState() => _UpcomingTuitionScreenState();
}

class _UpcomingTuitionScreenState extends State<UpcomingTuitionScreen> {

  final TuitionController tuitionController = Get.put(TuitionController());

  @override
  void initState() {
    super.initState();
    tuitionController.getSemesterId();
    tuitionController.getTuitionUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Upcoming tuition'),
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
                  text64Widget(text: 'Total credits: ${tuitionController.credit.value} (Unit price: 416,400đ / cre)'),
                  const SizedBox(height: 24,),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: tuitionController.tuitionUpcoming.length,
                      itemBuilder: (context, index) {
                        var tuition = tuitionController.tuitionUpcoming[index];
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
                                  tuition['name'],
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(79, 160, 171, 1),
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                text127Widget(text: 'Learning time: ${tuition['session']}'),
                                const SizedBox(height: 12,),
                                text127Widget(text: 'Credits: ${tuition['credit']}'),

                                const SizedBox(height: 32,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    text127Widget(text: '${tuitionController.formatNumber('${tuition['credit'] * 416400}')}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text64Widget(text: 'Total:'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${tuitionController.formatNumber('${tuitionController.credit.value * 416400}')}',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
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
