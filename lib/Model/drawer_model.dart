import 'package:flutter/material.dart';

class DrawerItem {
  final String iconPath;
  final String title;
  final Widget? screen;
  final VoidCallback? onTap;

  DrawerItem({
    required this.iconPath,
    required this.title,
    this.screen,
    this.onTap,
  });
}
