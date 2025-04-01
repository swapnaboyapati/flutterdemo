import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = "http://192.168.137.1:3000/api/user/login";

  static Future<bool> login(String pin) async {
    if (pin.length != 6) return false;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"pin": pin}),
      );

      final responseData = jsonDecode(response.body);
      print("Response: ${response.body}");

      if (response.statusCode == 200 && responseData["message"] == "Login successful") {
        return true;
      }
      return false;
    } catch (error) {
      print("Error: $error");
      return false;
    }
  }
}