import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_education/controller/UserController.dart';
import 'dart:convert';

import 'package:wave_education/model/CourseModel.dart';

class CourseController extends GetxController {
  Rx<List?> course = Rx<List?>(null);
  Rx<int?> courseLength = Rx<int?>(null);

  // Menyimpan status loading
  RxBool isLoading = false.obs;

  Future<void> getAllCourse() async {
    final userController = Get.put(UserController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('userToken') ?? '';
    try {
      isLoading.value = true; // Menandakan data sedang diambil
      final response = await http
          .get(Uri.parse('http://192.168.56.1:8080/api/courses/all'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      });

      // Mengecek apakah response berhasil (status code 200)
      if (response.statusCode == 302) {
        // Jika berhasil, konversikan data JSON menjadi objek User
        List<dynamic> data = jsonDecode(response.body);
        courseLength.value = data.length;
        course.value = data; // Simpan user yang berhasil diambil
      } else {
        // Jika gagal, tampilkan pesan kesalahan
        print('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      // Menangani error jika request gagal
      print('Error: $e');
    } finally {
      isLoading.value = false; // Menandakan data telah selesai diambil
    }
  }

  Future<void> getCourseById(int id) async {
    try {
      isLoading.value = true; // Menandakan data sedang diambil
      final response =
          await http.get(Uri.parse('http://192.168.56.1:8080/api/courses/all'));

      // Mengecek apakah response berhasil (status code 200)
      if (response.statusCode == 200) {
        // Jika berhasil, konversikan data JSON menjadi objek User
        List<dynamic> data = jsonDecode(response.body);
        List<Course> courses =
            data.map((data) => Course.fromJson(data)).toList();
      } else {
        // Jika gagal, tampilkan pesan kesalahan
        print('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      // Menangani error jika request gagal
      print('Error: $e');
    } finally {
      isLoading.value = false; // Menandakan data telah selesai diambil
    }
  }
}
