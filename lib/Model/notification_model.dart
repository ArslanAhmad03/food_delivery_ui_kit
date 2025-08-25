import 'package:flutter/material.dart';

class NotificationModel {
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  NotificationModel({required this.iconPath, required this.title, required this.onTap});
}
