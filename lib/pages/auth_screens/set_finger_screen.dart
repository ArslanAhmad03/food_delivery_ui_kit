import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/login_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/top_row.dart';

class SetFingerScreen extends StatelessWidget {
  const SetFingerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // top row
            TopRow(title: 'Set Your Fingerprint'),
            // content
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: h * 0.74,
                decoration: BoxDecoration(
                  color: AppColors.font2,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 4,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.',
                            align: TextAlign.left,
                          ),
                        ),

                        SizedBox(height: h * 0.02),

                        //
                        SizedBox(
                          height: w,
                          child: SvgPicture.asset(
                            'assets/svg/finger_icon.svg',
                            height: w * 0.8,
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(height: h * 0.05),

                        //
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: h * 0.05,
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      createRoute(widget: LoginScreen()),
                                    );
                                  },
                                  text: 'Skip',
                                  textColor: AppColors.orangeBase,
                                  borderRadius: 0.04,
                                  textStyle: const TextStyle(fontSize: 24),
                                  backgroundColor: AppColors.orange2,
                                ),
                              ),
                            ),

                            SizedBox(width: 6),
                            Expanded(
                              child: SizedBox(
                                height: h * 0.05,
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      createRoute(widget: LoginScreen()),
                                    );
                                  },
                                  text: 'Continue',
                                  borderRadius: 0.04,
                                  textStyle: const TextStyle(fontSize: 24),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
