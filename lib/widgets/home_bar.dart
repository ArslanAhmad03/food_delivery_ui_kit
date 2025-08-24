import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/widgets/icon_box.dart';

class HomeBar extends StatelessWidget {
  final VoidCallback onCartTap;
  const HomeBar({super.key, required this.onCartTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.font2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.orangeBase,
                      cursorHeight: 18,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.font,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => debugPrint('filter'),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: AppColors.orangeBase,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/filter.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconBox(onTap: onCartTap, imagePath: 'assets/svg/cart.svg'),
          const SizedBox(width: 4),
          IconBox(onTap: () {}, imagePath: 'assets/svg/notification.svg'),
          const SizedBox(width: 4),
          IconBox(onTap: () {}, imagePath: 'assets/svg/profile.svg'),
        ],
      ),
    );
  }
}

