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
      orderStatus: 'Active',
    ),
    OrderModel(
      image: 'assets/images/image02.png',
      title: 'Chicken Curry',
      time: '15 Nov, 11:20 pm',
      price: 40.0,
      items: 2,
      orderStatus: 'Completed',
    ),
    OrderModel(
      image: 'assets/images/coca_cola.png',
      title: 'Coke',
      time: '16 Nov, 01:20 pm',
      price: 12.0,
      items: 2,
      orderStatus: 'Active',
    ),
    OrderModel(
      image: 'assets/images/image04.png',
      title: 'Strawberry Shake',
      time: '17 Nov, 01:20 am',
      price: 15.0,
      items: 2,
      orderStatus: 'Cancelled',
    ),
    OrderModel(
      image: 'assets/images/grilled.png',
      title: 'Grilled',
      time: '18 Nov, 01:10 pm',
      price: 20.0,
      items: 2,
      orderStatus: 'Cancelled',
    ),
    OrderModel(
      image: 'assets/images/noodle.png',
      title: 'Noddle',
      time: '19 Nov, 01:20 pm',
      price: 20.0,
      items: 2,
      orderStatus: 'Active',
    ),
  ];

  bool isData = false;
  String selectedTab = 'Active';

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      if (!mounted) return;
      setState(() {
        isData = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    List<OrderModel> filteredOrders = orders
        .where((order) => order.orderStatus == selectedTab)
        .toList();

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
                    padding: EdgeInsets.only(
                      top: h * 0.02,
                      left: w * 0.05,
                      right: w * 0.05,
                      bottom: h * 0.02,
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
                              backgroundColor: selectedTab == 'Active'
                                  ? AppColors.orangeBase
                                  : AppColors.orange2,
                              textColor: selectedTab == 'Active'
                                  ? AppColors.orange2
                                  : AppColors.orangeBase,
                              onPressed: () {
                                setState(() => selectedTab = 'Active');
                              },
                            ),
                            CustomButton(
                              text: 'Completed',
                              height: 0.04,
                              borderRadius: 0.02,
                              backgroundColor: selectedTab == 'Completed'
                                  ? AppColors.orangeBase
                                  : AppColors.orange2,
                              textColor: selectedTab == 'Completed'
                                  ? AppColors.orange2
                                  : AppColors.orangeBase,
                              onPressed: () {
                                setState(() => selectedTab = 'Completed');
                              },
                            ),
                            CustomButton(
                              text: 'Cancelled',
                              height: 0.04,
                              borderRadius: 0.02,
                              backgroundColor: selectedTab == 'Cancelled'
                                  ? AppColors.orangeBase
                                  : AppColors.orange2,
                              textColor: selectedTab == 'Cancelled'
                                  ? AppColors.orange2
                                  : AppColors.orangeBase,
                              onPressed: () {
                                setState(() => selectedTab = 'Cancelled');
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(color: AppColors.orange2),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.76,
                          child: isData
                              ? (filteredOrders.isEmpty
                                    ? _buildEmptyState(w)
                                    : OrderItemCard(
                                        orders: filteredOrders,
                                        w: w,
                                      ))
                              : _buildLoadingState(w),
                        ),
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

  Widget _buildEmptyState(double w) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/onBoard01.svg',
            height: w * 0.4,
            color: AppColors.orange2,
          ),
          const SizedBox(height: 24),
          CustomText(
            text: "No $selectedTab orders available",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.orangeBase,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(double w) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/onBoard01.svg',
            height: w * 0.4,
            color: AppColors.orange2,
          ),
          const SizedBox(height: 24),
          CustomText(
            text: "Loading your orders...",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.orangeBase,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
