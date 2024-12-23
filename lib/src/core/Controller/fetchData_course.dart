import 'dart:convert'; // Untuk jsonDecode
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchDataCourse() async {
  try {
    final response =
        await http.get(Uri.parse("http://192.168.56.1:8080/api/users/1"));

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body); // Decode JSON menjadi List
    } else {
      throw Exception('Failed to load courses: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
    return {};
  }
}
