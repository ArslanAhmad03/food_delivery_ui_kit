import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';

class IconContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const IconContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: AppColors.orange2,
          borderRadius: BorderRadius.circular(18),
        ),
        child: SizedBox(height: 40, width: 40, child: Center(child: child)),
      ),
    );
  }
}
