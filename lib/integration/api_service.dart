import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/logger.dart';

/// ApiService class for handling API requests related to user authentication.
class ApiService {
  /// API endpoint for user login.
  static const String apiUrl = "http://192.168.137.1:3000/api/user/login";

  /// Sends a login request with the provided PIN.
  ///
  /// @param pin A 6-digit user PIN.
  /// @return A Future<bool> indicating success (true) or failure (false) of login.
  static Future<bool> login(String pin) async {
    // Validate PIN length
    if (pin.length != 6) {
      LoggerService.info("Invalid PIN length: $pin");
      return false;
    }

    try {
      LoggerService.info("Sending login request for PIN: $pin");

      // Sending HTTP POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"pin": pin}),
      );

      // Parse response JSON
      final responseData = jsonDecode(response.body);
      LoggerService.info("Response received: ${response.body}");

      // Check if login was successful
      if (response.statusCode == 200 && responseData["message"] == "Login successful") {
        LoggerService.info("Login successful for PIN: $pin");
        return true;
      } else {
        LoggerService.error("Login failed: ${responseData["message"]}");
        return false;
      }
    } catch (error, stackTrace) {
      // Handle and log any errors
      LoggerService.error("API error", error: error, stackTrace: stackTrace);
      return false;
    }
  }
}