import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';

class IconBox extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  const IconBox({
    super.key,
    required this.imagePath,
    this.onTap,
    this.height = 40,
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.font2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            height: height! / 2,
            width: height! / 2,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
