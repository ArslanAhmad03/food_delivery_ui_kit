import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/category_model.dart';
import 'package:food_delivery_ui_kit/Model/items_model.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/category_item.dart';
import 'package:food_delivery_ui_kit/widgets/custom_grid_card.dart';
import 'package:food_delivery_ui_kit/widgets/image_carousel_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<CategoryModel> categories = [
    CategoryModel(name: 'Snacks', iconPath: 'assets/svg/Snacks.svg'),
    CategoryModel(name: 'Meals', iconPath: 'assets/svg/Meals.svg'),
    CategoryModel(name: 'Vegan', iconPath: 'assets/svg/Vegan.svg'),
    CategoryModel(name: 'Desserts', iconPath: 'assets/svg/Desserts.svg'),
    CategoryModel(name: 'Drinks', iconPath: 'assets/svg/Drinks.svg'),
  ];

  final List<ItemsModel> items = [
    ItemsModel(price: '20.0', imagepath: 'assets/images/image01.png'),
    ItemsModel(price: '50.0', imagepath: 'assets/images/image02.png'),
    ItemsModel(price: '10.0', imagepath: 'assets/images/image03.png'),
    ItemsModel(price: '60.0', imagepath: 'assets/images/image04.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return SliverToBoxAdapter(
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
          child: Column(
            children: [
              // categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  return CategoryItem(
                    name: category.name,
                    iconPath: category.iconPath,
                  );
                }),
              ),
              Divider(color: AppColors.yellow2),

              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Best Seller',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomText(
                    text: 'View All',
                    color: AppColors.orangeBase,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 8),
                  SvgPicture.asset('assets/svg/nextIcon.svg'),
                ],
              ),

              //
              SizedBox(
                height: h * 0.14,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(items.length, (index) {
                      final item = items[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          height: h * 0.12,
                          width: w * 0.2,
                          decoration: BoxDecoration(
                            color: AppColors.orangeBase,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(item.imagepath),
                            ),
                          ),
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
                      );
                    }),
                  ),
                ),
              ),

              //
              SizedBox(height: 12),

              ImageCarouselCard(w: w - 20),

              SizedBox(height: 12),

              // Recommend
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Recommend',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 6),
              //
              CustomGridCard(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
