import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/Model/category_model.dart';
import 'package:food_delivery_ui_kit/data/app_data.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/widgets/category_detail_screen.dart';

class CustomGridCard extends StatefulWidget {
  const CustomGridCard({super.key});

  @override
  State<CustomGridCard> createState() => _CustomGridCardState();
}

class _CustomGridCardState extends State<CustomGridCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: itemsDetail.length,
      itemBuilder: (context, index) {
        final item = itemsDetail[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              createRoute(
                widget: CategoryDetailScreen(
                  item: CategoryModel(
                    name: 'Mushroom Risotto',
                    imagePath: 'assets/images/mashroom.png',
                    type: 'Vegan',
                    description: 'Tortilla Chips With Toppins',
                    price: '15',
                  ),
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.orange2,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.orangeBase),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(item.imagepath),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 6,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.font2,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: '5.0',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.star,
                                color: AppColors.yellowBase,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              item.favourite = !item.favourite;
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.font2,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              item.favourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.orangeBase.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: CustomText(
                        text: "\$${item.price}",
                        color: AppColors.font2,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
