import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/app_route_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/row_title.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class OrderDelivery extends StatefulWidget {
  const OrderDelivery({super.key});

  @override
  State<OrderDelivery> createState() => _OrderDeliveryState();
}

class _OrderDeliveryState extends State<OrderDelivery> {
  final List<Map<String, String>> trackingSteps = [
    {"status": "Your order has been accepted", "time": "2 min"},
    {"status": "The restaurant is preparing your order", "time": "5 min"},
    {"status": "The delivery is on his way", "time": "10 min"},
    {"status": "Your order has been delivered", "time": "8 min"},
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Delivery time'),

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
                        CustomText(
                          text: "Shipping Address",
                          fontSize: w * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: h * 0.02),

                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(w * 0.03),
                          decoration: BoxDecoration(
                            color: AppColors.orange2,
                            borderRadius: BorderRadius.circular(w * 0.05),
                          ),
                          child: CustomText(
                            text: '778 Locust View Drive Oaklanda, CA',
                          ),
                        ),

                        // map
                        SizedBox(height: h * 0.02),

                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: AppColors.orange2,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/map.png'),
                            ),
                          ),
                        ),

                        // deleivery & time
                        SizedBox(height: h * 0.02),
                        rowTitle(w: w, title: 'Delivery Time', editShow: false),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(text: 'Estimated Delivery'),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                text: "25 mins",
                                fontSize: 24,
                                color: AppColors.orangeBase,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Divider(color: AppColors.orange2),

                        // track time points
                        SizedBox(height: h * 0.02),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: trackingSteps.length,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Dots and Line
                                Column(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: AppColors.orangeBase,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    if (index != trackingSteps.length - 1)
                                      Container(
                                        width: 2,
                                        height: 30,
                                        color: AppColors.orangeBase.withOpacity(
                                          0.4,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 12),

                                // Text & Time
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            text:
                                                trackingSteps[index]['status']!,
                                          ),
                                        ),
                                        CustomText(
                                          text: trackingSteps[index]['time']!,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),

                        // button row
                        SizedBox(height: h * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 30,
                              width: w * 0.4,
                              child: CustomButton(
                                text: 'Return Home',
                                backgroundColor: AppColors.orange2,
                                textColor: AppColors.orangeBase,
                                borderRadius: 0.02,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    createRoute(widget: AppRouteScreen()),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: w * 0.4,
                              child: CustomButton(
                                text: 'Track Order',
                                backgroundColor: AppColors.orangeBase,
                                textColor: AppColors.font2,
                                borderRadius: 0.02,
                                onPressed: () {},
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
