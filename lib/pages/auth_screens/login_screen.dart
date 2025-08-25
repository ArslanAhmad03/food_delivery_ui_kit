import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/pages/app_route_screen.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/forget_screen.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/register_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/custom_text_form_feild.dart';
import 'package:food_delivery_ui_kit/utils/icon_container.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/top_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // top row
            TopRow(isCheck: true, title: 'Log In'),
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
                            text: 'Welcome',
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: h * 0.04),
                        //
                        CustomTextFormField(
                          label: 'Email or Phone Number',
                          hintText: 'example@gmail.com',
                        ),

                        SizedBox(height: h * 0.02),

                        CustomTextFormField(
                          label: 'Password',
                          hintText: '********',
                          obscureText: true,
                          toggleObscureText: () {},
                        ),

                        SizedBox(height: h * 0.02),

                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                createRoute(widget: ForgetScreen()),
                              );
                            },
                            child: CustomText(
                              text: 'forget password',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),

                        SizedBox(height: h * 0.06),

                        SizedBox(
                          height: h * 0.05,
                          width: w * 0.5,
                          child: CustomButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                createRoute(widget: AppRouteScreen()),
                              );
                            },
                            text: 'Log In',
                            borderRadius: 0.04,
                            textStyle: const TextStyle(fontSize: 24),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 12),
                          child: CustomText(text: 'Or'),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconContainer(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/svg/gmail_icon.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 6),
                            IconContainer(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/svg/facebook_icon.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 6),
                            IconContainer(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/svg/finger_icon.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.04),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: "Don't have an account?"),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  createRoute(widget: RegisterScreen()),
                                );
                              },
                              child: CustomText(
                                text: 'Sign Up',
                                fontWeight: FontWeight.w800,
                                color: AppColors.orangeBase,
                              ),
                            ),
                          ],
                        ),
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
