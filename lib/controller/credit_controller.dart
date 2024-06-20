import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vku_app/controller/api_constants.dart';

class CreditController extends GetxController {
  RxList<dynamic> creditGroupList = [].obs;
  RxList<dynamic> creditProjectList = [].obs;
  RxList<dynamic> creditResultList = [].obs;
  RxList<dynamic> progressList = [].obs;

  // Lấy danh sách các học phần đăng ký
  Future<void> getCreditList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    int? semesterId = prefs.getInt('semesterId');

    if (studentId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}student/get/group'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'student_id': studentId,
            'semester_id': semesterId,
          }),
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          creditGroupList.value = responseBody['group'];
          creditProjectList.value = responseBody['project'];
          creditResultList.value = responseBody['result'];
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

  // Xem tiến độ học tập
  Future<void> learningProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    if (studentId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}student/progress'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'student_id': studentId,
          }),
        );

        if (response.statusCode == 200) {
          var progressData = json.decode(response.body);
          if (progressData is List) {
            // Xử lý dữ liệu nếu phản hồi là một danh sách
            progressList.assignAll(progressData);
          } else {
            throw Exception('Unexpected format for project data');
          }
          for (var item in progressList) {
            print(item['name']);
          }
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
}