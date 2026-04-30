import 'package:flutter/material.dart';
import 'package:testapp/colors/appcolors.dart';
import 'package:testapp/screens/attendence_screen.dart';
import 'package:testapp/screens/dashbaord_screen.dart';
import 'package:testapp/screens/payment_screen.dart';
import 'package:testapp/screens/staff_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List pages = [
    DashbaordScreen(),
    StaffScreen(),
    AttendenceScreen(),
    PaymentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: AppColors.primarycolor,
        unselectedItemColor: AppColors.greyColor,
        unselectedLabelStyle: TextStyle(color: AppColors.greyColor),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Staff'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Attendence',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Payroll'),
        ],
      ),
    );
  }
}
