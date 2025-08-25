import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class SliverTopRow extends StatelessWidget {
  final String title;
  const SliverTopRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: AppColors.yellowBase,
      expandedHeight: 20,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
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
            ),
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
      ),
    );
  }
}
