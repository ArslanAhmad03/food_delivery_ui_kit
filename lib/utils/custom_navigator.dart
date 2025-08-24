import 'package:flutter/material.dart';

enum PageAnimation {
  fade,
  slideFromRight,
  slideFromLeft,
  slideFromTop,
  slideFromBottom,
  scale,
  fadeScale,
}

Route<dynamic> createRoute({
  required Widget widget,
  PageAnimation animation = PageAnimation.slideFromRight,
  int transitionDuration = 500,
  Curve curve = Curves.easeInOut,
}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: transitionDuration),
    reverseTransitionDuration: Duration(milliseconds: transitionDuration),
    pageBuilder: (context, animationController, secondaryAnimation) => widget,
    transitionsBuilder: (context, animationController, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: curve,
      );

      switch (animation) {
        case PageAnimation.fade:
          return FadeTransition(opacity: curvedAnimation, child: child);

        case PageAnimation.slideFromLeft:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );

        case PageAnimation.slideFromRight:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );

        case PageAnimation.slideFromTop:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );

        case PageAnimation.slideFromBottom:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );

        case PageAnimation.scale:
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.8,
              end: 1.0,
            ).animate(curvedAnimation),
            child: child,
          );

        case PageAnimation.fadeScale:
          return FadeTransition(
            opacity: curvedAnimation,
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.8,
                end: 1.0,
              ).animate(curvedAnimation),
              child: child,
            ),
          );
      }
    },
  );
}
