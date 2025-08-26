import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/Model/order_model.dart';
import 'package:food_delivery_ui_kit/pages/app_route_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class ReviewScreen extends StatelessWidget {
  final OrderModel orderItem;
  const ReviewScreen({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Leave a Review'),

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
                        SizedBox(height: h * 0.04),
                        // Image
                        Container(
                          width: w * 0.35,
                          height: w * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w * 0.05),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(orderItem.image),
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.02),

                        // Title
                        CustomText(
                          text: orderItem.title,
                          fontSize: w * 0.06, // Responsive font
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: h * 0.015),

                        // Subtitle
                        CustomText(
                          text:
                              "We'd love to know what you\nthink of your dish.",
                          fontSize: w * 0.045,
                          align: TextAlign.center,
                        ),
                        SizedBox(height: h * 0.025),

                        // Stars Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: w * 0.015,
                              ),
                              child: Icon(
                                Icons.star_border,
                                size: w * 0.08,
                                color: AppColors.yellowBase,
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: h * 0.03),

                        // Comment Prompt
                        CustomText(
                          text: "Leave us your comment!",
                          fontSize: w * 0.045,
                          align: TextAlign.center,
                        ),
                        SizedBox(height: h * 0.02),

                        // Text Field
                        Container(
                          padding: EdgeInsets.all(w * 0.03),
                          decoration: BoxDecoration(
                            color: AppColors.orange2,
                            borderRadius: BorderRadius.circular(w * 0.05),
                          ),
                          child: TextField(
                            maxLines: 4,
                            style: TextStyle(
                              color: AppColors.orangeBase,
                              fontSize: w * 0.045,
                            ),
                            decoration: InputDecoration(
                              hintText: "Write Review...",
                              hintStyle: TextStyle(fontSize: w * 0.045),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.1),

                        // Buttons Row
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'Cancel',
                                height: 0.05,
                                borderRadius: 0.04,
                                backgroundColor: AppColors.orange2,
                                textColor: AppColors.orangeBase,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            SizedBox(width: w * 0.05),
                            Expanded(
                              child: CustomButton(
                                text: 'Submit',
                                height: 0.05,
                                borderRadius: 0.04,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    createRoute(widget: AppRouteScreen()),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.08),
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
