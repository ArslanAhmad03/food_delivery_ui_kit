import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/login_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/custom_text_form_feild.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/top_row.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // top row
            TopRow(isCheck: true, title: 'New Account'),
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
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //
                          CustomTextFormField(
                            label: 'Full Name',
                            hintText: 'elif la',
                          ),

                          SizedBox(height: h * 0.02),

                          CustomTextFormField(
                            label: 'Email or Phone Number',
                            hintText: 'example@gmail.com',
                          ),

                          SizedBox(height: h * 0.02),

                          CustomTextFormField(
                            label: 'Mobile Number',
                            hintText: '+923012345678',
                          ),

                          SizedBox(height: h * 0.02),

                          CustomTextFormField(
                            label: 'Date of Birth',
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

                          CustomTextFormField(
                            label: 'Confirm Password',
                            hintText: '********',
                            obscureText: true,
                            toggleObscureText: () {},
                          ),

                          SizedBox(height: h * 0.02),

                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "By continuing, you agree to",
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: CustomText(
                                        text: 'Terms of Use',
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.orangeBase,
                                      ),
                                    ),
                                    CustomText(text: " and "),
                                    GestureDetector(
                                      onTap: () {},
                                      child: CustomText(
                                        text: 'Privacy Policy.',
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.orangeBase,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: h * 0.02),

                          SizedBox(
                            height: h * 0.05,
                            width: w * 0.5,
                            child: CustomButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: 'Sign Up',
                              borderRadius: 0.04,
                              textStyle: const TextStyle(fontSize: 24),
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 12),
                            child: CustomText(text: 'Or'),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "Already have an account?"),
                              SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    createRoute(widget: LoginScreen()),
                                  );
                                },
                                child: CustomText(
                                  text: 'Log In',
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
            ),
          ],
        ),
      ),
    );
  }
}
