import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/pages/auth_screens/welcome_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Onboarding data list
  final List<Map<String, String>> onBoardData = [
    {
      "image": "assets/images/onBoard01.png",
      "svg": "assets/svg/onBoard01.svg",
      "title": "Order for Food",
      "description":
          "Lorem ipsum dolor sit amet, conse ctetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna.",
    },
    {
      "image": "assets/images/onBoard02.png",
      "svg": "assets/svg/onBoard02.svg",
      "title": "Easy Payment",
      "description":
          "Lorem ipsum dolor sit amet, conse ctetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna.",
    },
    {
      "image": "assets/images/onBoard03.png",
      "svg": "assets/svg/onBoard03.svg",
      "title": "Fast Delivery",
      "description":
          "Lorem ipsum dolor sit amet, conse ctetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna.",
    },
  ];

  void _nextPage() {
    if (_currentPage < onBoardData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(context, createRoute(widget: WelcomeScreen()));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onBoardData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    onBoardData[index]['image']!,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            //
            if (_currentPage != onBoardData.length - 1)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        createRoute(widget: WelcomeScreen()),
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          CustomText(
                            text: 'Skip',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.orangeBase,
                          ),
                          SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/svg/nextIcon.svg',
                            height: 14,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // Bottom content container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: h * 0.45,
                decoration: BoxDecoration(
                  color: _currentPage == onBoardData.length - 1
                      ? AppColors.font2.withOpacity(0.60)
                      : AppColors.font2.withOpacity(0.86),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          onBoardData[_currentPage]['svg']!,
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      //
                      CustomText(
                        text: onBoardData[_currentPage]['title']!,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orangeBase,
                      ),
                      SizedBox(height: h * 0.02),
                      CustomText(
                        text: onBoardData[_currentPage]['description']!,
                        align: TextAlign.center,
                      ),
                      SizedBox(height: h * 0.02),

                      // Page indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onBoardData.length, (dotIndex) {
                          bool isActive = _currentPage == dotIndex;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 4,
                            width: isActive ? 30 : 10,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.orangeBase
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: h * 0.05),

                      // next/ started
                      SizedBox(
                        height: h * 0.05,
                        width: w * 0.5,
                        child: CustomButton(
                          onPressed: _nextPage,
                          text: _currentPage == onBoardData.length - 1
                              ? 'Get Started'
                              : 'Next',
                          borderRadius: 0.04,
                          textStyle: const TextStyle(fontSize: 24),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                        ),
                      ),
                    ],
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
