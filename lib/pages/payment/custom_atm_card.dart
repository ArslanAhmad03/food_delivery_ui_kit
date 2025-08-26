import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class CustomAtmCard extends StatelessWidget {
  const CustomAtmCard({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Container(
      height: h * 0.25,
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.05),
      decoration: BoxDecoration(
        color: AppColors.yellowBase,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [AppColors.yellowBase, Colors.orangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Top Row - Bank Name and Chip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Bank',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Chip Icon
              Container(
                width: w * 0.12,
                height: w * 0.09,
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.sim_card,
                  color: Colors.brown,
                  size: w * 0.08,
                ),
              ),
            ],
          ),

          /// Card Number
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.015),
            child: Text(
              '1234 5678 9012 3456',
              style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.07,
                letterSpacing: 2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// Bottom Row - Card Holder & Expiry
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CARD HOLDER',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: w * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: h * 0.005),
                  Text(
                    'JOHN DOE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXPIRES',
                    style: TextStyle(color: Colors.white70, fontSize: w * 0.03),
                  ),
                  SizedBox(height: h * 0.005),
                  Text(
                    '12/27',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
