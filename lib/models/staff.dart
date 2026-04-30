// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Staff {
  final Icon icon;
  final Color color;
  final String label;
  final int number;

  final String? name;
  final String? pos;
  Staff({
    required this.icon,
    required this.color,
    required this.label,
    required this.number,
    this.name,
    this.pos,
  });
}
