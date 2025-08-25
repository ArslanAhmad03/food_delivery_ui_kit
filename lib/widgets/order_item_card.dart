import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/Model/order_model.dart';
import 'package:food_delivery_ui_kit/pages/order_screens/order_cancel.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

class OrderItemCard extends StatelessWidget {
  final List<OrderModel> orders;
  final double w;
  const OrderItemCard({super.key, required this.orders, required this.w});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
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
              // Image
              Container(
                width: w * 0.2,
                height: w * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(order.image),
                  ),
                ),
              ),
              SizedBox(width: 10),

              // Left Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: order.title,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4),
                    CustomText(text: order.time),
                    SizedBox(height: 6),
                    CustomButton(
                      text: 'Cancel Order',
                      textStyle: TextStyle().copyWith(fontSize: 12),
                      height: 0.035,
                      borderRadius: 0.02,
                      onPressed: () {
                        Navigator.push(
                          context,
                          createRoute(widget: OrderCancel()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(width: 4),

              // Right Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: '\$${order.price}',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 4),
                  CustomText(text: '${order.items} Items'),
                  SizedBox(height: 6),
                  CustomButton(
                    text: 'Track Driver',
                    textStyle: TextStyle().copyWith(fontSize: 12),
                    height: 0.035,
                    borderRadius: 0.02,
                    textColor: AppColors.orangeBase,
                    backgroundColor: AppColors.orange2,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
