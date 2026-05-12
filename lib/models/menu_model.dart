import 'package:flutter/cupertino.dart';

class MenuModel {
  final String label;
  final IconData icon;
  final Color color;
  final Widget page;

  MenuModel({
    required this.label,
    required this.icon,
    required this.color,
    required this.page,
  });
}
