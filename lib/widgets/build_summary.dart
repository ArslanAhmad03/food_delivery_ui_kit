import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

class BuildSummary extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Color textColor;
  const BuildSummary({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
    this.textColor = AppColors.font2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          color: textColor,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: isBold ? 18 : 16,
        ),
        CustomText(
          text: value,
          color: textColor,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: isBold ? 18 : 16,
        ),
      ],
    );
  }
}
