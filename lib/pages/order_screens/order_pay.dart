import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/cart_model.dart';
import 'package:food_delivery_ui_kit/pages/order_screens/order_delivery.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/row_title.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class OrderPay extends StatelessWidget {
  final List<CartModel> items;
  final double total;
  const OrderPay({super.key, required this.items, required this.total});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Payment'),

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

                        // order summary
                        SizedBox(height: h * 0.05),
                        rowTitle(w: w, title: 'Order Summary', onTap: () {}),

                        SizedBox(height: h * 0.01),

                        Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: item.title,
                                        fontSize: 14,
                                      ),
                                      SizedBox(width: 12),
                                      CustomText(
                                        text: '1 items',
                                        color: AppColors.orangeBase,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 30),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                text: "\$${total.toStringAsFixed(2)}",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.02),
                        Divider(color: AppColors.orange2),

                        // payment
                        SizedBox(height: h * 0.02),

                        //
                        rowTitle(w: w, title: 'Payment Method', onTap: () {}),

                        SizedBox(height: h * 0.01),

                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset('assets/svg/wallet.svg'),
                            ),
                            SizedBox(width: 10),
                            Expanded(child: CustomText(text: 'Credit Card')),

                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                text: "25 mins",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.02),
                        Divider(color: AppColors.orange2),

                        // time
                        SizedBox(height: h * 0.02),

                        //
                        rowTitle(w: w, title: 'Delivery Time', editShow: false),

                        SizedBox(height: h * 0.01),

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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Divider(color: AppColors.orange2),

                        SizedBox(height: h * 0.16),

                        //
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 30,
                            width: w * 0.4,
                            child: CustomButton(
                              text: 'Pay Now',
                              backgroundColor: AppColors.orange2,
                              textColor: AppColors.orangeBase,
                              borderRadius: 0.02,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  createRoute(widget: OrderDelivery()),
                                );
                              },
                            ),
                          ),
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
