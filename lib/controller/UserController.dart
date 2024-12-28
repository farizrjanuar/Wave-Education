// ignore_for_file: avoid_print

import 'package:wave_education/model/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart'; // Import GetX

class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);
  Rx<List?> enrolledCourses = Rx<List?>(null);

  // Menyimpan status loading
  RxBool isLoading = false.obs;

  Future<void> getUserById() async {
    try {
      isLoading.value = true; // Menandakan data sedang diambil
      final response =
          await http.get(Uri.parse('http://192.168.56.1:8080/api/users/1'));

      // Mengecek apakah response berhasil (status code 200)
      if (response.statusCode == 200) {
        // Jika berhasil, konversikan data JSON menjadi objek User
        Map<String, dynamic> data = jsonDecode(response.body);
        user.value = User.fromJson(data); // Simpan user yang berhasil diambil
      } else {
        // Jika gagal, tampilkan pesan kesalahan
        print('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // DESCRIPTION : Mendapatkan Course yang telah di Enroll oleh User
  Future<void> getUserEnrolledCoursesById(int userId) async {
    final userController = Get.put(UserController());
    try {
      // Menandakan data sedang diambil
      final response = await http.get(
          Uri.parse(
            "http://192.168.56.1:8080/api/users/${userController.user.value?.userID}/courses",
          ),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${userController.user.value?.token}'
          });
      if (response.statusCode == 302) {
        List<dynamic> data = jsonDecode(response.body);
        enrolledCourses.value = data;
      } else {
        // Jika gagal, tampilkan pesan kesalahan
        print(
            'Failed to load user data: ${response.statusCode} + ${response.body} + is token exist ${userController.user.value?.token}');
      }
    } catch (e) {
      // Menangani error jika request gagal
      print('Error: $e');
    } finally {
      isLoading.value = false; // Menandakan data telah selesai diambil
    }
  }

  Future<http.Response> enrollCourse(int courseId) async {
    final userController = Get.put(UserController());

    print(
        "ini id user ${userController.user.value?.userID} dan ini id course ${courseId}");
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/api/users/enroll'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${userController.user.value?.token}' // Menambahkan token ke header
        },
        body: jsonEncode({
          'courseId': courseId,
          'userId': userController.user.value?.userID
        }),
      );

      return response; // Return the response to handle it outside
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  // Method untuk menambahkan user (register user)

  // Method Login User

  RxString errorMessage = ''.obs;

  Future<bool> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      if (email.isEmpty || password.isEmpty) {
        errorMessage.value = 'Email and password cannot be empty';
        return false;
      }

      // if (!GetUtils.isEmail(email)) {
      //   print("error?");
      //   errorMessage.value = 'Please enter a valid email';
      //   return false;
      // }

      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        user.value = User.fromJson(data['userDTO']);
        user.value?.token = data['accessToken'];
        // Assuming your API returns user data
        // await getUserById(); // Get complete user data
        return true;
      } else {
        print("halo");
        errorMessage.value = 'Invalid email or password';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Connection error. Please try again.';
      return false;
    } finally {
      print("error?");
      isLoading.value = false;
    }
  }

  // Method untuk membuat user baru
  Future<http.Response> register(
      String fullname, String email, String password) async {
    // Menyiapkan data user
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/api/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'fullname': fullname, 'email': email, 'password': password}),
      );

      return response; // Return the response to handle it outside
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }
}
