import 'dart:async';
import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/Screens/LoginScreen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: isConnected ? 1.0 : 0.0,
              child: const Image(
                height: 165,
                width: 165,
                image: AssetImage('assets/images/Logo3.png'),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(microseconds: 300),
              opacity: isConnected ? 1.0 : 0.0,
              child: const Text(
                'iDIRTRACK',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            isConnected
                ? const SizedBox.shrink()
                : const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Simulate connection status check and redirect to LoginScreen
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isConnected = true;
      });
    }).then((_) => Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }));
  }
}
