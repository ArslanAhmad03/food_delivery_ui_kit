import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/order_model.dart';
import 'package:food_delivery_ui_kit/data/app_data.dart';
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
  bool isData = false;
  String selectedTab = 'Active';

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((_) {
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
            SliverTopRow(isShow: false, title: 'My Orders'),

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
