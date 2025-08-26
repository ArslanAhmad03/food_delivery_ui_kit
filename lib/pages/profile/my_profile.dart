import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/app_route_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text_form_feild.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'My Profile'),

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
                    padding: EdgeInsets.only(
                      top: h * 0.02,
                      left: w * 0.05,
                      right: w * 0.05,
                      bottom: h * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: h * 0.02),
                        Stack(
                          children: [
                            // image
                            Container(
                              width: w * 0.3,
                              height: w * 0.3,
                              decoration: BoxDecoration(
                                color: AppColors.orangeBase,
                                borderRadius: BorderRadius.circular(w * 0.05),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2025/04/28/19/59/female-model-9565629_640.jpg',
                                  ),
                                ),
                              ),
                            ),

                            //
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.orangeBase,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.03),

                        //
                        CustomTextFormField(
                          label: 'Full Name',
                          hintText: 'elif la',
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: h * 0.022),

                        CustomTextFormField(
                          label: 'Email or Phone Number',
                          hintText: 'example@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(height: h * 0.022),

                        CustomTextFormField(
                          label: 'Mobile Number',
                          hintText: '+923012345678',
                          keyboardType: TextInputType.number,
                        ),

                        SizedBox(height: h * 0.022),

                        CustomTextFormField(
                          label: 'Date of Birth',
                          hintText: 'example@gmail.com',
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: h * 0.1),

                        // Buttons Row
                        CustomButton(
                          text: 'Update Profile',
                          // height: 0.05,
                          // borderRadius: 0.04,
                          onPressed: () {
                            Navigator.push(
                              context,
                              createRoute(widget: AppRouteScreen()),
                            );
                          },
                        ),
                        //
                        SizedBox(height: h * 0.09),
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
