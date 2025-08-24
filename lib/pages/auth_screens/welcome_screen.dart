import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/login_screen.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/register_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    final titleFontSize = w * 0.09;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // iamge logo
              SvgPicture.asset(
                'assets/svg/logo.svg',
                height: h * 0.26,
                width: w * 0.5,
                fit: BoxFit.contain,
                color: Theme.of(context).colorScheme.secondary,
              ),
              //
              SizedBox(height: h * 0.05),

              // title
              RichText(
                text: TextSpan(
                  text: 'YUM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  children: [
                    TextSpan(
                      text: 'QUICK',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFontSize,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              //
              SizedBox(height: h * 0.05),

              //
              CustomText(
                text:
                    'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod.',
                color: Theme.of(context).colorScheme.onPrimary,
                align: TextAlign.center,
              ),

              SizedBox(height: h * 0.05),

              // buttons
              SizedBox(
                width: w * 0.5,
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      createRoute(widget: LoginScreen()),
                    );
                  },
                  text: 'Log In',
                  borderRadius: 0.04,
                  textStyle: TextStyle(fontSize: 24),
                  textColor: AppColors.orangeBase,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),

              SizedBox(height: h * 0.02),

              SizedBox(
                width: w * 0.5,
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      createRoute(widget: RegisterScreen()),
                    );
                  },
                  text: 'Sign Up',
                  borderRadius: 0.04,
                  textStyle: TextStyle(fontSize: 24),
                  textColor: AppColors.orangeBase,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
