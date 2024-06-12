import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vku_app/controller/api_constants.dart';

class TuitionController extends  GetxController {
  RxList<dynamic> tuitionPaid = [].obs;
  RxList<dynamic> tuitionUpcoming = [].obs;
  RxInt credit = 0.obs;
  RxString totalTuitionPaid = ''.obs;
  var semesterId = 0.obs;

  // Lấy id học kỳ hiện tại
  Future<void> getSemesterId() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}semester'));
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        var id = responseBody['semester']['id'];
        semesterId.value = id;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Lấy thông tin học phi sắp tới
  Future<void> getTuitionUpcoming() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    int? semesterId = prefs.getInt('semesterId');
    if (studentId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}student/tution'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'id_student': studentId,
            'id_semester': semesterId,
          }),
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          tuitionUpcoming.value = responseBody['tution'];
          credit.value = responseBody['credit'];
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      throw Exception('Student ID not found');
    }
  }

  // Lấy các thông tin học phí đã nộp
  Future<void> getTuitionPaid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    final response = await http.get(Uri.parse('${baseUrl}student/tution/paid/$studentId'));
    if (response.statusCode == 200) {
      var tuitionData = json.decode(response.body);
      tuitionPaid.value = tuitionData['tution'];
      totalTuitionPaid.value = tuitionData['total'].toString();
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Format Number
  String formatNumber(String value) {
    String numberString = value.replaceAll(RegExp(r','), '');
    int? number = int.tryParse(numberString);
    if (number == null) {
      return 'Invalid number';
    }
    // Định dạng số thành dạng có dấu chấm phẩy
    return '${number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
}