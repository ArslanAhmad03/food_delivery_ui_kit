  import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

Widget rowTitle({
    required final double w,
    required String title,
    final bool editShow = true,
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, fontSize: w * 0.06, align: TextAlign.center),
        if (editShow == true) ...[
          Container(
            decoration: BoxDecoration(
              color: AppColors.orange2,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
            child: GestureDetector(
              onTap: onTap,
              child: CustomText(
                text: 'Edit',
                fontSize: 12,
                color: AppColors.orangeBase,
              ),
            ),
          ),
        ] else ...[
          SizedBox(),
        ],
      ],
    );
  }