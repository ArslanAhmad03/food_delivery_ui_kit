import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/app_route_screen.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';

class OrderCancelled extends StatefulWidget {
  const OrderCancelled({super.key});

  @override
  State<OrderCancelled> createState() => _OrderCancelledState();
}

class _OrderCancelledState extends State<OrderCancelled> {
  void orderCancelled() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(context, createRoute(widget: AppRouteScreen()));
    });
  }

  @override
  void initState() {
    orderCancelled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
