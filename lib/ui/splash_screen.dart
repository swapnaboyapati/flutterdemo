import 'dart:async';
import 'package:flutter/material.dart';
import 'employee_login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Alignment topPartAlignment = const Alignment(-1.2, -1.2);  // Top-left corner
  Alignment middlePartAlignment = Alignment.center;
  Alignment bottomPartAlignment = const Alignment(1.2, 1.2); // Bottom-right corner

  double topOpacity = 0.0;
  double middleOpacity = 0.0;
  double bottomOpacity = 0.0;
  double middleScale = 0.2;
  double bottomScale = 0.2;
  double middleRotation = 0.0; // Start with 0 rotation

  @override
  void initState() {
    super.initState();

    // Start animation after 500ms
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        topPartAlignment = const Alignment(-0.0, -0.15);
        bottomPartAlignment = const Alignment(0.0, 0.1);
        middlePartAlignment = Alignment.center;

        topOpacity = 1.0;
        middleOpacity = 1.0;
        bottomOpacity = 1.0;
        middleScale = 1.0;
        bottomScale = 1.0;
        middleRotation = 360;
      });
    });

    // Navigate to next page after 4 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EmployeeLoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Top part (Arrow)
          AnimatedAlign(
            duration: const Duration(seconds: 3),
            curve: Curves.easeOut,
            alignment: topPartAlignment,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3),
              opacity: topOpacity,
              child: Image.asset('assets/top.jpg', width: 20),
            ),
          ),

          // Middle part (Red Arc) with rotation effect
          AnimatedAlign(
            duration: const Duration(seconds: 3),
            curve: Curves.easeOut,
            alignment: middlePartAlignment,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3),
              opacity: middleOpacity,
              child: AnimatedRotation(
                duration: const Duration(seconds: 3),
                turns: middleRotation / 360,
                curve: Curves.easeOut,
                child: AnimatedScale(
                  duration: const Duration(seconds: 3),
                  scale: middleScale,
                  curve: Curves.easeOut,
                  child: Image.asset('assets/rr.jpg', width: 180),
                ),
              ),
            ),
          ),

          // Bottom part (Text "PINAKA") with scaling effect
          AnimatedAlign(
            duration: const Duration(seconds: 3),
            curve: Curves.easeOut,
            alignment: bottomPartAlignment,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3),
              opacity: bottomOpacity,
              child: AnimatedScale(
                duration: const Duration(seconds: 3),
                scale: bottomScale, // Starts at 20% and grows to 100%
                curve: Curves.easeOut,
                child: Image.asset('assets/lp.jpg', width: 130),
              ),
            ),
          ),
        ],
      ),
    );
  }
}