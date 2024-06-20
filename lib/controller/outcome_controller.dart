import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vku_app/controller/api_constants.dart';

class OutcomeController extends GetxController {
  RxList<dynamic> scoretList = [].obs;

  // Lấy thông tin điểm của sinh viên
  Future<void> getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    final response = await http.get(Uri.parse('${baseUrl}student/list/$studentId'));
    if (response.statusCode == 200) {
      scoretList.value = json.decode(response.body)['subject'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Xem chi tiết điểm từng môn học
  Future<Map<String, dynamic>> getScoreDetail(int id) async {
    final response = await http.get(Uri.parse('${baseUrl}student/score/detail/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['score'];
    } else {
      throw Exception('Failed to load score detail');
    }
  }

  // Màu cho điểm chữ
  Color getColorForScore(String score) {
    switch (score) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.blue;
      case 'C':
        return Colors.grey;
      case 'D':
        return Colors.yellow;
      case 'F':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  // ------------------------- TEACHER -------------------------

  RxList<dynamic> scoreList = [].obs;
  var subjectId = 0.obs;

  Future<void> getScoreTeacher() async {
    final response = await http.get(Uri.parse('${baseUrl}teacher/show/score/${subjectId.value}'));
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var scoreData = responseBody['score'];
      if (scoreData is List) {
        // Xử lý dữ liệu nếu phản hồi là một danh sách
        scoreList.assignAll(scoreData);
      } else if (scoreData is Map<String, dynamic>) {
        // Xử lý dữ liệu nếu phản hồi là một đối tượng
        scoreList.assignAll([scoreData]);
      } else {
        throw Exception('Unexpected format for project data');
      }
      print(subjectId);
    } else {
      throw Exception('Failed to load data');
    }
  }
}