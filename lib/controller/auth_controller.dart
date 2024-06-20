import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vku_app/views/login_screen.dart';
import 'package:vku_app/controller/api_constants.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:vku_app/views/new_password_screen.dart';
import 'package:vku_app/views/otp_screen.dart';
import 'package:vku_app/views/students/home_screen.dart';
import 'package:vku_app/views/teachers/teacher_home_screen.dart';

class AuthController extends GetxController {

  String name = '';
  String get nameStudent => name;

  String teacherName = '';
  String get nameTeacher => teacherName;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getStudentInfo();
    getTeacherInfo();
  }

  // Xử lý đăng nhập
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
          Get.snackbar(
            'Error',
            'Email or Password incorrect. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        // Xử lý lỗi từ phía server
        Get.snackbar(
          'Error',
          'Login Failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Xử lý lỗi kết nối
      Get.snackbar(
        'Error',
        'Login Failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Check Email có tồn tại không. Nếu có chuyển qua OTPScreen, nếu không nhập lại
  Future<void> checkEmail(String email, int role) async {
    isLoading.value = true;

    final response = await http.post(
      Uri.parse('${baseUrl}check/mail'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'role': role,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['status'] == 200) {
        Get.to(() => OTPScreen(email: email, role: role));
      } else if (responseBody['errors'] == 404) {
        Get.snackbar(
          'Error',
          'Email not found. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'An error occurred. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Gửi OTP về Email
  Future<void> sendOTP(String email, int role) async {
    isLoading.value = true;

    final response = await http.post(
      Uri.parse('${baseUrl}sendmail'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'role': role,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['status'] != 200) {
        Get.snackbar(
          'Error',
          'Failed to send OTP. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'An error occurred. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Kiểm tra OTP có trùng với OTP gửi về email không
  Future<void> verifyOTP(String email, String otp, int role) async {
    isLoading.value = true;

    final response = await http.post(
      Uri.parse('${baseUrl}check/otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'otp_pin': otp,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody['status'] == 400) {
        Get.to(() => const NewPasswordScreen(), arguments: {'email': email, 'role': role});
      } else {
        Get.snackbar(
          'Error',
          'Invalid OTP. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'An error occurred. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Lấy thông tin Sinh viên đã lưu trên SharedPreferences
  void getStudentInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('studentName') ?? '';
    update();
  }

  // Lấy thông tin Giảng viên đã lưu trên SharedPreferences
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