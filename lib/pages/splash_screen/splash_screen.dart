import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/pages/on_board_screens/on_board_screen.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        _opacity = 1;
        _scale = 1;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        createRoute(
          widget: OnBoardScreen(),
          animation: PageAnimation.fadeScale,
          transitionDuration: 600,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    final titleFontSize = w * 0.09;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: _opacity,
            curve: Curves.easeInOut,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // iamge logo
                  SvgPicture.asset(
                    'assets/svg/logo.svg',
                    height: h * 0.26,
                    width: w * 0.5,
                    fit: BoxFit.contain,
                  ),
                  //
                  SizedBox(height: h * 0.05),

                  // title
                  RichText(
                    text: TextSpan(
                      text: 'YUM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFontSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      children: [
                        TextSpan(
                          text: 'QUICK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
