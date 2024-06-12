import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vku_app/views/login_screen.dart';
import 'package:vku_app/controller/api_constants.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:vku_app/views/students/home_screen.dart';
import 'package:vku_app/views/teachers/teacher_home_screen.dart';

class AuthController extends GetxController {

  String name = '';
  String get nameStudent => name;

  String teacherName = '';
  String get nameTeacher => teacherName;

  @override
  void onInit() {
    super.onInit();
    getStudentInfo();
    getTeacherInfo();
  }

  Future<void> login(TextEditingController emailController,
      TextEditingController passwordController, int selectedRadio) async {
    String email = emailController.text;
    String password = passwordController.text;
    int role = selectedRadio;

    // Gửi thông tin đăng nhập lên API để xác thực
    var apiUrl = '${baseUrl}student/login';
    var body = jsonEncode({
      'email': email,
      'password': password,
      'role': role.toString(),
    });
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(apiUrl), body: body, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == 200) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          if (role == 1) {
            var student = data['student'];
            int studentId = student['id'];
            String studentCode = student['code'];
            String studentName = student['name'];

            await prefs.setInt('studentId', studentId);
            await prefs.setString('studentCode', studentCode);
            await prefs.setString('studentName', studentName);

            print('Login successfully!');
            Get.to(() => const HomeScreen());
          } else {
            var teacher =data['teacher'];
            int teacherId = teacher['id'];
            String teacherName = teacher['name'];

            await prefs.setInt('teacherId', teacherId);
            await prefs.setString('teacherName', teacherName);

            print('Login successfully!');
            Get.to(() => const TeacherHomeScreen());
          }
        } else {
          // Xác thực không thành công, hiển thị thông báo lỗi trong console
          print('Login information is incorrect! Please re-enter!');
        }
      } else {
        // Xử lý lỗi từ phía server
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý lỗi kết nối
      print('Network error: $e');
    }
  }

  // Lấy thông tin Sinh viên đã lưu trên SharedPreferences
  void getStudentInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('studentName') ?? '';
    update();
  }

  void getTeacherInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    teacherName = prefs.getString('teacherName') ?? '';
    update();
  }

  // Sign Out
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('studentId'); // Xóa thông tin đăng nhập
    await prefs.remove('studentCode');
    await prefs.remove('studentName');

    Get.offAll(() => const LoginScreen());
  }
}