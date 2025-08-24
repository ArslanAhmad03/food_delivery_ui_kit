import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String iconPath;

  const CategoryItem({super.key, required this.name, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.yellow2,
            borderRadius: BorderRadius.circular(60),
          ),
          child: SizedBox(
            height: 60,
            width: 50,
            child: Center(
              child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
            ),
          ),
        ),
        const SizedBox(height: 6),
        CustomText(text: name),
      ],
    );
  }
}
