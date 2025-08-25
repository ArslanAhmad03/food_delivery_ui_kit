import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/home_screen/home_body.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/cart_drawer.dart';
import 'package:food_delivery_ui_kit/widgets/home_bar.dart';
import 'package:food_delivery_ui_kit/widgets/notify_drawer.dart';
import 'package:food_delivery_ui_kit/widgets/profile_drawer.dart';

enum DrawerType { none, cart, notify, profile }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerType _activeDrawer = DrawerType.none;

  void _toggleDrawer(DrawerType drawer) {
    setState(() {
      _activeDrawer = (_activeDrawer == drawer) ? DrawerType.none : drawer;
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: Stack(
        children: [
          //
          CustomScrollView(
            slivers: [
              // appbar
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.yellowBase,
                pinned: true,
                elevation: 0,
                expandedHeight: 10,
                flexibleSpace: HomeBar(
                  onCartTap: () => _toggleDrawer(DrawerType.cart),
                  onNotifyTap: () => _toggleDrawer(DrawerType.notify),
                  onProfileTap: () => _toggleDrawer(DrawerType.profile),
                ),
              ),

              // greetings
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Good Morning',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.font2,
                      ),
                      CustomText(
                        text: "Rise and shine! It's breakfast time",
                        color: AppColors.orangeBase,
                      ),
                    ],
                  ),
                ),
              ),

              // body
              HomeBody(),
            ],
          ),

          // profile overlay
          if (_activeDrawer != DrawerType.none)
            GestureDetector(
              onTap: () => _toggleDrawer(DrawerType.none),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: 0.35,
                child: Container(color: Colors.black),
              ),
            ),

          // cart drawer
          CartDrawer(showDrawer: _activeDrawer == DrawerType.cart),
          NotifyDrawer(showDrawer: _activeDrawer == DrawerType.notify),
          ProfileDrawer(showDrawer: _activeDrawer == DrawerType.profile),
        ],
      ),
    );
  }
}
