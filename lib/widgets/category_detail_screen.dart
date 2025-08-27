import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/category_model.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class CategoryDetailScreen extends StatefulWidget {
  final CategoryModel item;
  const CategoryDetailScreen({super.key, required this.item});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'assets/svg/backIcon.svg',
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.7,
                    height: w * 0.22,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: CustomText(
                        text: widget.item.name,
                        fontSize: w * 0.08,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),
                ],
              ),
            ),

            //
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.font2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(w * 0.05),
                    topRight: Radius.circular(w * 0.05),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // image
                      Container(
                        height: h * 0.24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.item.imagePath),
                          ),
                        ),
                      ),

                      //
                      SizedBox(height: h * 0.02),
                      CustomText(
                        text: "\$${widget.item.price!}.00",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orangeBase,
                      ),
                      Divider(color: AppColors.orangeBase),

                      SizedBox(height: h * 0.02),

                      CustomText(
                        text: widget.item.description!,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),

                      SizedBox(height: h * 0.01),

                      CustomText(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                        fontSize: 16,
                      ),

                      SizedBox(height: h * 0.02),

                      CustomText(
                        text: "Toppings",
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),

                      //
                      SizedBox(height: h * 0.02),
                      Column(
                        children: List.generate(4, (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: 'Guacamole'),
                                CustomText(text: '\$2.00'),
                              ],
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: h * 0.04),
                      CustomButton(text: 'Add to Cart', onPressed: () {}),
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
