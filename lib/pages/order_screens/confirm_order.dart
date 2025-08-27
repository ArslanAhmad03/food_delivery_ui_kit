import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/Model/cart_model.dart';
import 'package:food_delivery_ui_kit/pages/order_screens/order_cancel.dart';
import 'package:food_delivery_ui_kit/pages/order_screens/order_pay.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/build_summary.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class ConfirmOrder extends StatelessWidget {
  final List<CartModel> cartItems;
  final double subtotal;
  final double tax;
  final double deliveryFee;
  final double total;
  const ConfirmOrder({
    super.key,
    required this.cartItems,
    required this.subtotal,
    required this.tax,
    required this.deliveryFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Confirm Order'),

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

                        SizedBox(height: h * 0.02),

                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Order Summary",
                              fontSize: w * 0.05,
                              align: TextAlign.center,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.orange2,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 2,
                              ),
                              child: CustomText(
                                text: 'Edit',
                                fontSize: 12,
                                color: AppColors.orangeBase,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.01),

                        //
                        Divider(color: AppColors.orange2),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartItems[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //
                                  Container(
                                    width: w * 0.2,
                                    height: w * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(cartItem.imagePath),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),

                                  //
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: cartItem.title,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: 4),
                                        CustomText(text: cartItem.time!),
                                        SizedBox(height: 6),

                                        SizedBox(
                                          width: 110,
                                          child: CustomButton(
                                            text: 'Cancel Order',

                                            backgroundColor: AppColors.orange2,
                                            textColor: AppColors.orangeBase,
                                            textStyle: TextStyle().copyWith(
                                              fontSize: 12,
                                            ),
                                            height: 0.03,
                                            borderRadius: 0.02,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                createRoute(
                                                  widget: OrderCancel(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                        text: '\$${cartItem.price}',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: 4),
                                      CustomText(text: '${1} Items'),
                                      SizedBox(height: 8),

                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_circle,
                                            color: AppColors.orangeBase,
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          CustomText(
                                            text: '2',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.add_circle,
                                            color: AppColors.orangeBase,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        SizedBox(height: h * 0.01),

                        Divider(color: AppColors.orange2),

                        //
                        Column(
                          children: [
                            BuildSummary(
                              title: 'Subtotal',
                              value: '\$${subtotal.toStringAsFixed(2)}',
                              isBold: true,
                              textColor: AppColors.font,
                            ),
                            SizedBox(height: 6),
                            BuildSummary(
                              title: 'Tax & Fees',
                              value: '\$${tax.toStringAsFixed(2)}',
                              isBold: true,
                              textColor: AppColors.font,
                            ),
                            SizedBox(height: 6),
                            BuildSummary(
                              title: 'Delivery',
                              value: '\$${deliveryFee.toStringAsFixed(2)}',
                              isBold: true,
                              textColor: AppColors.font,
                            ),
                            SizedBox(height: 10),
                            Divider(color: AppColors.orange2),
                            SizedBox(height: 10),
                            BuildSummary(
                              title: 'Total',
                              value: '\$${total.toStringAsFixed(2)}',
                              isBold: true,
                              textColor: AppColors.font,
                            ),

                            SizedBox(height: h * 0.04),

                            SizedBox(
                              height: 30,
                              width: w * 0.4,
                              child: CustomButton(
                                text: 'Place Order',
                                backgroundColor: AppColors.orange2,
                                textColor: AppColors.orangeBase,
                                borderRadius: 0.02,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    createRoute(
                                      widget: OrderPay(
                                        items: cartItems,
                                        total: total,
                                      ),
                                    ),
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
