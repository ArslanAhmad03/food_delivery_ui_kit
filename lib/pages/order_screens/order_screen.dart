import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/order_model.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/order_item_card.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final orders = [
    OrderModel(
      image: 'assets/images/burger01.png',
      title: 'Burger',
      time: '14 Nov, 04:20 pm',
      price: 05.0,
      items: 4,
    ),
    OrderModel(
      image: 'assets/images/image02.png',
      title: 'Chicken',
      time: '15 Nov, 11:20 pm',
      price: 40.0,
      items: 2,
    ),
    OrderModel(
      image: 'assets/images/coca_cola.png',
      title: 'Coke',
      time: '16 Nov, 01:20 pm',
      price: 12.0,
      items: 2,
    ),
    OrderModel(
      image: 'assets/images/image04.png',
      title: 'Strawberry Shake',
      time: '17 Nov, 01:20 am',
      price: 15.0,
      items: 2,
    ),
    OrderModel(
      image: 'assets/images/grilled.png',
      title: 'Grilled',
      time: '18 Nov, 01:10 pm',
      price: 20.0,
      items: 2,
    ),
    OrderModel(
      image: 'assets/images/noodle.png',
      title: 'Noddle',
      time: '19 Nov, 01:20 pm',
      price: 20.0,
      items: 2,
    ),
  ];

  bool isData = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(() {
        isData = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ap bar
            SliverTopRow(title: 'My Orders'),

            // // body
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.font2,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 20,
                      right: 20,
                      bottom: 4,
                    ),
                    child: Column(
                      children: [
                        // buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              text: 'Active',
                              height: 0.04,
                              borderRadius: 0.02,
                              onPressed: () {},
                            ),
                            CustomButton(
                              text: 'Completed',
                              height: 0.04,
                              borderRadius: 0.02,
                              textColor: AppColors.orangeBase,
                              backgroundColor: AppColors.orange2,
                              onPressed: () {},
                            ),
                            CustomButton(
                              text: 'Cancelled',
                              height: 0.04,
                              borderRadius: 0.02,
                              textColor: AppColors.orangeBase,
                              backgroundColor: AppColors.orange2,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(color: AppColors.orange2),

                        //
                        if (isData) ...[
                          if (orders.length < 4) ...[
                            OrderItemCard(orders: orders, w: w),
                          ] else ...[
                            OrderItemCard(orders: orders, w: w),
                          ],
                        ] else ...[
                          SizedBox(height: w * 0.5),
                          SvgPicture.asset(
                            'assets/svg/onBoard01.svg',
                            height: w * 0.4,
                            color: AppColors.orange2,
                          ),
                          const SizedBox(height: 24),
                          CustomText(
                            text:
                                "You don't have\nany active orders\nat this time",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orangeBase,
                            align: TextAlign.center,
                          ),
                          SizedBox(height: w * 0.6),
                        ],
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
