import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/login_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

class CusBottomSheet extends StatelessWidget {
  const CusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          CustomText(
            text: "Are you sure you want to log out?",
            fontSize: 18,
            fontWeight: FontWeight.w800,
            align: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                text: 'Cancel',
                backgroundColor: AppColors.orange2,
                textColor: AppColors.orangeBase,
                height: 0.04,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CustomButton(
                text: 'Yes, logout',
                backgroundColor: AppColors.orangeBase,
                textColor: AppColors.font2,
                height: 0.04,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    createRoute(widget: LoginScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
