import 'package:flutter/material.dart';
import 'package:testapp/screens/attendence_screen.dart';
import 'package:testapp/screens/dashbaord_screen.dart';
import 'package:testapp/screens/payment_screen.dart';
import 'package:testapp/screens/splash_screen.dart';
import 'package:testapp/screens/staff_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/dashboard': (context) => DashbaordScreen(),
        'staff': (context) => StaffScreen(),
        '/atten': (context) => AttendenceScreen(),
        '/pay': (context) => PaymentScreen(),
      },
    );
  }
}
