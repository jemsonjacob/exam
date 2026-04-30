import 'package:flutter/material.dart';

class AppColors {
  static const Color primarycolor = Color.fromARGB(238, 0, 12, 87);
  static const Color secondarycolor = Colors.white;
  static const Color greyColor = Colors.grey;
}

Widget customAppBar(String title) {
  return AppBar(
    backgroundColor: AppColors.primarycolor,
    title: Text("Payroll", style: TextStyle(color: AppColors.secondarycolor)),
    automaticallyImplyLeading: false,
    centerTitle: false,
  );
}
