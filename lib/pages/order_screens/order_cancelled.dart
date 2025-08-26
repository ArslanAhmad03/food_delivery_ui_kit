import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/app_route_screen.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class OrderCancelled extends StatefulWidget {
  const OrderCancelled({super.key});

  @override
  State<OrderCancelled> createState() => _OrderCancelledState();
}

class _OrderCancelledState extends State<OrderCancelled> {
  void orderCancelled() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
        context,
        createRoute(widget: const AppRouteScreen()),
      );
    });
  }

  @override
  void initState() {
    orderCancelled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.06,
              vertical: h * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //
                      Container(
                        height: h * 0.18,
                        width: h * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.cancel_presentation_outlined,
                          size: h * 0.1,
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: h * 0.03),

                      //
                      CustomText(
                        text: 'Order Cancelled!',
                        fontSize: w * 0.07,
                        fontWeight: FontWeight.bold,
                        align: TextAlign.center,
                      ),
                      SizedBox(height: h * 0.015),

                      //
                      CustomText(
                        text: 'Your order has been successfully\ncancelled',
                        fontSize: w * 0.045,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                //
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.03),
                  child: CustomText(
                    text:
                        'If you have any question reach directly to our\ncustomer support',
                    fontSize: w * 0.04,
                    align: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
