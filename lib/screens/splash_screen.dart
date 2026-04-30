import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/colors/appcolors.dart';
import 'package:testapp/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomEnd,
            colors: [Colors.blueAccent, Colors.blue],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Staff App",
              style: TextStyle(
                color: AppColors.secondarycolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.secondarycolor,
            ),
          ],
        ),
      ),
    );
  }
}
