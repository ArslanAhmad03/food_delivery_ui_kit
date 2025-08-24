import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/Model/category_model.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/category_item.dart';
import 'package:food_delivery_ui_kit/widgets/home_bar.dart';
import 'package:food_delivery_ui_kit/widgets/icon_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showDrawer = false;
  void _toggleDrawer() => setState(() => _showDrawer = !_showDrawer);

  final List<CategoryModel> categories = [
    CategoryModel(name: 'Snacks', iconPath: 'assets/svg/Snacks.svg'),
    CategoryModel(name: 'Meals', iconPath: 'assets/svg/Meals.svg'),
    CategoryModel(name: 'Vegan', iconPath: 'assets/svg/Vegan.svg'),
    CategoryModel(name: 'Desserts', iconPath: 'assets/svg/Desserts.svg'),
    CategoryModel(name: 'Drinks', iconPath: 'assets/svg/Drinks.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    final panelWidth = (w * 0.78).clamp(260.0, 420.0);

    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                  flexibleSpace: HomeBar(onCartTap: _toggleDrawer),
                ),

                //
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

                // categories
                SliverToBoxAdapter(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(categories.length, (index) {
                          final category = categories[index];
                          return CategoryItem(
                            name: category.name,
                            iconPath: category.iconPath,
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Scrim overlay
            if (_showDrawer)
              GestureDetector(
                onTap: _toggleDrawer,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: 0.35,
                  child: Container(color: Colors.black),
                ),
              ),

            // Drawer
            AnimatedSlide(
              offset: _showDrawer ? Offset.zero : const Offset(1, 0),
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: panelWidth - 20,
                  height: h,
                  child: Material(
                    elevation: 12,
                    color: AppColors.orangeBase,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(),
                            title: Text("john smith"),
                            subtitle: Text("Loremipsum@email.com"),
                          ),

                          SizedBox(height: 20),

                          SizedBox(
                            child: Row(
                              children: [
                                IconBox(
                                  height: 30,
                                  width: 30,
                                  imagePath: 'assets/svg/cart.svg',
                                ),
                                SizedBox(width: 12),
                                CustomText(
                                  text: 'My Orders',
                                  color: AppColors.font2,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
