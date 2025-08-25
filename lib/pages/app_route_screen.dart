import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/pages/home_screen/home_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';

class AppRouteScreen extends StatefulWidget {
  const AppRouteScreen({super.key});

  @override
  State<AppRouteScreen> createState() => _AppRouteScreenState();
}

class _AppRouteScreenState extends State<AppRouteScreen> {
  final pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  final List listScreens = [
    HomeScreen(),
    Center(child: Text('Orders')),
    Center(child: Text('Favourites')),
    Center(child: Text('Menu')),
    Center(child: Text('Help')),
  ];

  final List<String> icons = [
    'assets/svg/home.svg',
    'assets/svg/meal.svg',
    'assets/svg/favourite.svg',
    'assets/svg/group_menu.svg',
    'assets/svg/contact_us.svg',
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            listScreens.length,
            (index) => listScreens[index],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            pageController.jumpToPage(index);
          });
        },
        backgroundColor: AppColors.orangeBase,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: List.generate(icons.length, (index) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icons[index],
              colorFilter: ColorFilter.mode(
                index == selectedIndex ? AppColors.yellowBase : Colors.white,
                BlendMode.srcIn,
              ),
              width: 26,
              height: 26,
            ),
            label: '',
          );
        }),
      ),
    );
  }
}
