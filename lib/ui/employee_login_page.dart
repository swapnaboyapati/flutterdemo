import 'dart:async';
import 'package:flutter/material.dart';
import '../integration/api_service.dart';
import '../utils/logger.dart';
import '../widgets/number_pad.dart';
import '../widgets/pin_input.dart';
import 'success_page.dart';

/// EmployeeLoginPage is a stateful widget that allows employees to log in using a PIN.
/// It includes an animated image slideshow and a number pad for PIN input.
class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  _EmployeeLoginPageState createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  String pin = "";
  int _currentImageIndex = 0;

  // List of image assets for the slideshow
  final List<String> _imagePaths = [
    'assets/logo.png',
    'assets/image.png',
    'assets/imagee.png',
  ];

  @override
  void initState() {
    super.initState();
    _startImageSlideshow();
  }

  /// Starts a periodic timer to cycle through the images in the slideshow.
  void _startImageSlideshow() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _imagePaths.length;
      });
    });
  }

  /// Handles number pad key presses to update the PIN input.
  /// @param value The value of the pressed key.
  void _onKeyPressed(String value) {
    setState(() {
      if (value == "C") {
        pin = "";
      } else if (value == "⌫" && pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
      } else if (pin.length < 6 && value != "C" && value != "⌫") {
        pin += value;
      }
    });
  }

  // /// Attempts to log in using the entered PIN.
  // /// Calls the API service and navigates to the success page on success.
  // Future<void> _login() async {
  //   LoggerService.info("User attempting login with PIN: \$pin");
  //   final success = await ApiService.login(pin);
  //
  //   if (success) {
  //     LoggerService.info("Login successful. Navigating to SuccessPage.");
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const SuccessPage()),
  //     );
  //   } else {
  //     LoggerService.error("Login failed for PIN: \$pin");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Invalid PIN or Server Error")),
  //     );
  //   }
  // }

  Future<void> _login() async {
    if (pin == "999999") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuccessPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid PIN")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            // Image slideshow on the left
            Expanded(
              child: Image.asset(
                _imagePaths[_currentImageIndex],
                fit: BoxFit.cover,
              ),
            ),
            // Login form on the right
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/img.jpg', height: 120),
                  const Text(
                    'Employee Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Please input your PIN to validate yourself',
                    style: TextStyle(fontSize: 16, color: Color(0xFF00008B)),
                  ),
                  const SizedBox(height: 30),
                  PinInput(pin: pin),
                  const SizedBox(height: 20),
                  SizedBox(width: 310, child: NumberPad(onKeyPressed: _onKeyPressed)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 310,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}