import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vku_app/controller/api_constants.dart';

class SubjectController extends GetxController {
  var semesterCode = ''.obs;

  // Lấy thông tin học kỳ hiện tại
  Future<void> getSemester() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}semester'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['semester'];
        semesterCode.value = data['code'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('semesterId', data['id']);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Lấy thứ, ngày, tháng hiện tại
  Map<String, String> getDateTime() {
    DateTime now = DateTime.now();

    int weekday = now.weekday;
    int day = now.day;
    int month = now.month;

    String weekdayName = '';
    switch (weekday) {
      case 1:
        weekdayName = 'Mon';
        break;
      case 2:
        weekdayName = 'Tue';
        break;
      case 3:
        weekdayName = 'Wed';
        break;
      case 4:
        weekdayName = 'Thu';
        break;
      case 5:
        weekdayName = 'Fri';
        break;
      case 6:
        weekdayName = 'Sat';
        break;
      case 7:
        weekdayName = 'Sun';
        break;
    }
    return {
      'weekdayName': weekdayName,
      'day': day.toString(),
      'month': month.toString(),
    };
  }

  // ------------------------- STUDENT -------------------------

  RxList<dynamic> subjectList = [].obs;
  RxList<dynamic> subjectInfo = [].obs;
  RxList<dynamic> subjectInfoContent = [].obs;
  RxList<dynamic> subjectListOfDay = [].obs;
  RxList<dynamic> subjectListSchedule = [].obs;
  RxList<dynamic> projectList = [].obs;
  RxList<dynamic> projectInfoList = [].obs;
  var sectionId = 0.obs;
  var projectId = 0.obs;
  var projectTitle = ''.obs;

  // Lấy các môn học theo ngày hiện tại
  Future<void> getSubjectOfDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    final response = await http.get(Uri.parse('${baseUrl}student/index/$studentId'));
    if (response.statusCode == 200) {
      subjectListOfDay.value = json.decode(response.body)['section'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Lấy các môn học của học kỳ hiện tại
  Future<void> getSubjectOfSemester() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    final response = await http.get(Uri.parse('${baseUrl}student/list/semester/subject/$studentId'));
    if (response.statusCode == 200) {
      subjectList.value = json.decode(response.body)['subject'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Lấy thông tin môn học
  Future<void> getSubjectInfo() async {
    final response = await http.get(Uri.parse('${baseUrl}student/detail/subject/${sectionId}'));
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var subjectListInfo = responseBody['section'];
      var subjectListInfoList = responseBody['content'];

      if (subjectListInfo is List) {
        // Xử lý dữ liệu nếu phản hồi là một danh sách
        subjectInfo.assignAll(subjectListInfo);
      } else if (subjectListInfo is Map<String, dynamic>) {
        // Xử lý dữ liệu nếu phản hồi là một đối tượng
        subjectInfo.assignAll([subjectListInfo]);
      } else {
        throw Exception('Unexpected format for project data');
      }

      if (subjectListInfoList is List) {
        // Xử lý dữ liệu nếu phản hồi là một danh sách
        subjectInfoContent.assignAll(subjectListInfoList);
      } else if (subjectListInfoList is Map<String, dynamic>) {
        // Xử lý dữ liệu nếu phản hồi là một đối tượng
        subjectInfoContent.assignAll([subjectListInfoList]);
      } else {
        throw Exception('Unexpected format for project data');
      }
      print(subjectInfo);
      print(subjectInfoContent);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Lấy môn học theo theo thứ ngày trong tuần
  Future<void> getSubjectSchedule(int dayIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    int dayId = dayIndex + 2;

    if (studentId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}student/get/subject/schedule'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'id_student': studentId,
            'id': dayId,
          }),
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          subjectListSchedule.value = responseBody['section'];
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

  // Lấy tiêu đề lớp đồ án
  Future<void> getProjectTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    int? semesterId = prefs.getInt('semesterId');

    if (studentId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}student/get/projectclass'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'student_id': studentId,
            'semester_id': semesterId,
          }),
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          projectList.value = responseBody['project'];
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

  // Lấy thông tin lớp đồ án
  Future<void> getProjectInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? studentId = prefs.getInt('studentId');
    int? semesterId = prefs.getInt('semesterId');

    if (studentId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}student/get/detail/project'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'id_student': studentId,
            'id_semester': semesterId,
            'id': projectId.value,
          }),
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          var projectData = responseBody['project'];
          if (projectData is List) {
            // Xử lý dữ liệu nếu phản hồi là một danh sách
            projectInfoList.assignAll(projectData);
          } else if (projectData is Map<String, dynamic>) {
            // Xử lý dữ liệu nếu phản hồi là một đối tượng
            projectInfoList.assignAll([projectData]);
          } else {
            throw Exception('Unexpected format for project data');
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

  // ------------------------- TEACHER -------------------------

  RxList<dynamic> subjectSemesterTeacher = [].obs;
  RxList<dynamic> subjectInfoTeacher = [].obs;
  RxList<dynamic> subjectScheduleTeacher = [].obs;
  var subjectId = 0.obs;

  // Lấy các môn học của học kỳ hiện tại
  Future<void> getSubjectSemesterTeacher() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? teacherId = prefs.getInt('teacherId');
    final response = await http.get(Uri.parse('${baseUrl}teacher/get/subject/$teacherId'));
    if (response.statusCode == 200) {
      subjectSemesterTeacher.value = json.decode(response.body)['subject'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Lấy thông tin môn học
  Future<void> getSubjectInfoTeacher() async {
    final response = await http.get(Uri.parse('${baseUrl}teacher/detail/subject/${subjectId.value}'));
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var subjectData = responseBody['section'];
      if (subjectData is List) {
        // Xử lý dữ liệu nếu phản hồi là một danh sách
        subjectInfoTeacher.assignAll(subjectData);
      } else if (subjectData is Map<String, dynamic>) {
        // Xử lý dữ liệu nếu phản hồi là một đối tượng
        subjectInfoTeacher.assignAll([subjectData]);
      } else {
        throw Exception('Unexpected format for project data');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Lấy môn học theo theo thứ ngày trong tuần
  Future<void> getSubjectScheduleTeacher(int dayIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? teacherId = prefs.getInt('teacherId');
    int dayId = dayIndex + 2;

    if (teacherId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}teacher/get/subject/schedule'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'id_teacher': teacherId,
            'id': dayId,
          }),
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          subjectScheduleTeacher.value = responseBody['section'];
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      throw Exception('Teacher ID not found');
    }
  }

  // Lấy môn học theo ngày hiện tại
  Future<void> getSubjectOfDayTeacher() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? teacherId = prefs.getInt('teacherId');
    DateTime now = DateTime.now();

    int weekday = now.weekday;
    int dayId = weekday + 1;

    if (teacherId != null) {
      try {
        final response = await http.post(
          Uri.parse('${baseUrl}teacher/get/subject/schedule'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'id_teacher': teacherId,
            'id': dayId,
          }),
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          subjectScheduleTeacher.value = responseBody['section'];
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      throw Exception('Teacher ID not found');
    }
  }
}