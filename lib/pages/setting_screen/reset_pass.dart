import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/forget_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/custom_text_form_feild.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Password Setting'),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.02),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.font2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(w * 0.05),
                      topRight: Radius.circular(w * 0.05),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        SizedBox(height: h * 0.02),

                        //
                        CustomTextFormField(
                          label: 'Current Password',
                          hintText: '********',
                          obscureText: true,
                          keyboardType: TextInputType.text,
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
                              text: 'Forget Password?',
                              color: AppColors.orangeBase,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),

                        SizedBox(height: h * 0.02),

                        CustomTextFormField(
                          label: 'New Password',
                          hintText: '********',
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          toggleObscureText: () {},
                        ),

                        SizedBox(height: h * 0.02),

                        CustomTextFormField(
                          label: 'Confirm New Password',
                          hintText: '********',
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          toggleObscureText: () {},
                        ),

                        SizedBox(height: h * 0.32),

                        CustomButton(
                          text: 'Change Password',
                          // height: 0.05,
                          // borderRadius: 0.04,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                        SizedBox(height: h * 0.1),
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
