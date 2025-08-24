import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class TopRow extends StatelessWidget {
  final String title;
  final bool isCheck;
  const TopRow({super.key, this.isCheck = false, required this.title});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Positioned(
      top: h * 0.09,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isCheck == false
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      'assets/svg/backIcon.svg',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox(height: 20, width: 20),
          SizedBox(
            width: w * 0.7,
            height: w * 0.12,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: CustomText(
                text: title,
                fontSize: w * 0.10,
                fontWeight: FontWeight.bold,
                color: AppColors.font2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
