import 'package:flutter/material.dart';

class DrawerItem {
  final String iconPath;
  final String title;
  final Widget screen;

  DrawerItem({
    required this.iconPath,
    required this.title,
    required this.screen,
  });
}
