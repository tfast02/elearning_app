import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vku_app/controller/credit_controller.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';

class RegisterCredit extends StatefulWidget {
  const RegisterCredit({super.key});

  @override
  State<RegisterCredit> createState() => _RegisterCreditState();
}

class _RegisterCreditState extends State<RegisterCredit> {
  final CreditController creditController = Get.put(CreditController());

  @override
  void initState() {
    super.initState();
    creditController.getCreditList();
  }

  int selectedRadio = 1;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(text: 'Đăng ký tín chỉ'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Group subjects
                  text64Widget(text: 'Học phần đăng ký theo nhóm'),

                  const SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 251, 253, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, right: 40, bottom: 32, left: 40),
                      child: Column(
                        children: [
                          for (int i = 0; i < creditController.creditGroupList.length; i += 2)
                            Row(
                              children: [
                                if (i < creditController.creditGroupList.length)
                                  Expanded(
                                    child: RadioListTile(
                                      value: creditController.creditGroupList[i]['id'],
                                      groupValue: selectedRadio,
                                      onChanged: (val) {
                                        setSelectedRadio(val!);
                                      },
                                      title: Text(
                                        creditController.creditGroupList[i]['name'],
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF4FA0AB),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (i + 1 < creditController.creditGroupList.length)
                                  Expanded(
                                    child: RadioListTile(
                                      value: creditController.creditGroupList[i + 1]['id'],
                                      groupValue: selectedRadio,
                                      onChanged: (val) {
                                        setSelectedRadio(val!);
                                      },
                                      title: Text(
                                        creditController.creditGroupList[i + 1]['name'],
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF4FA0AB),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          const SizedBox(height: 24,),
                          GestureDetector(
                            child: Container(
                              width: 136,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4FA0AB),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Đăng ký',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Individual subjects
                  const SizedBox(height: 32,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text64Widget(text: 'Học phần đăng ký riêng lẻ'),

                      const SizedBox(height: 20,),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: creditController.creditProjectList.length,
                          itemBuilder: (context, index) {
                            var project = creditController.creditProjectList[index];
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: text127Widget(text: project['name']),
                                    ),
                                    Container(
                                      width: 62,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: project['active'] == 1
                                            ? const Color.fromRGBO(191, 191, 191, 1)
                                            : const Color.fromRGBO(79, 160, 171, 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            project['active'] == 1 ? 'Đã đăng ký' : 'Đăng ký',
                                            style: GoogleFonts.inter(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16,),
                                  ],
                                ),
                                const SizedBox(height: 12,),
                              ],
                            );
                          }
                      ),
                    ],
                  ),

                  const SizedBox(height: 12,),
                  text64Widget(text: 'Học phần đã đăng ký'),

                  const SizedBox(height: 20,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: creditController.creditResultList.length,
                    itemBuilder: (context, index) {
                      var result = creditController.creditResultList[index];
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
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
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text64Widget(text: result['id'].toString()),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            result['name']?.toString() ?? result['title'],
                                            style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(79, 160, 171, 1),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          text127Widget(text: result['teacher']),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Week: ${result['week']?.toString() ?? ''}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(86, 78, 177, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  Text(
                                    result['desc']?.toString() ?? '',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(86, 78, 177, 1),
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
