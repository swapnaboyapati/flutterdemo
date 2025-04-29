import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/number_pad.dart';
import '../widgets/pin_input.dart';
import 'success_page.dart';

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  _EmployeeLoginPageState createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  String pin = "";

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
        child: SizedBox(
          width: 1920,
          height: 1080,
          child: Row(
            children: [
              // Left Side - Image + Caption
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/POS-systems.jpg',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 70,
                      left: 150,
                      right: 150,
                      child: Text(
                        '"Designed for speed and efficiency — PINAKA POS helps you complete sales in seconds with an intuitive and user-friendly interface."',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // Right Side - Login Form
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/pinaka.png',
                        height: 100,
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'Employee Login',
                        style: TextStyle(
                          color: Colors.red, fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 0.9,
                        ),
                      ),
                      const SizedBox(height: 19),
                      Text(
                        'Please Input your PIN to Validate your self',
                        style: TextStyle(
                          color: const Color(0xFF4C5F7D),
                          fontSize: 18.5,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.92,
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: 450,
                        child: Column(
                          children: [
                            PinInput(pin: pin),
                            const SizedBox(height: 20),
                            NumberPad(onKeyPressed: _onKeyPressed),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(440, 40),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}