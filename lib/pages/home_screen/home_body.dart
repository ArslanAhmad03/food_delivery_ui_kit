import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/category_model.dart';
import 'package:food_delivery_ui_kit/data/app_data.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/best_seller_detail.dart';
import 'package:food_delivery_ui_kit/widgets/category_detail_screen.dart';
import 'package:food_delivery_ui_kit/widgets/category_item.dart';
import 'package:food_delivery_ui_kit/widgets/custom_grid_card.dart';
import 'package:food_delivery_ui_kit/widgets/image_carousel_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    List<CategoryModel> filteredItems = [];
    if (selectedIndex != -1) {
      filteredItems = getCategory
          .where((item) => item.type == categories[selectedIndex].name)
          .toList();
    }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // categories row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  return CategoryItem(
                    name: category.name,
                    iconPath: category.imagePath,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                  );
                }),
              ),
              Divider(color: AppColors.yellow2),

              //
              if (selectedIndex != -1) ...[
                SizedBox(height: 12),
                CustomText(
                  text: 'Selected Category: ${categories[selectedIndex].name}',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8),
                Column(
                  children: filteredItems.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          createRoute(widget: CategoryDetailScreen(item: item)),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: h * 0.2,
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(item.imagePath),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: item.name,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: item.price!,
                                fontSize: 18,
                                color: AppColors.orangeBase,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          CustomText(
                            text: item.description!,
                            fontWeight: FontWeight.bold,
                          ),

                          Divider(color: AppColors.orange2),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ] else ...[
                //
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: 'Best Seller',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          createRoute(widget: BestSellerDetail()),
                        );
                      },
                      child: CustomText(
                        text: 'View All',
                        color: AppColors.orangeBase,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset('assets/svg/nextIcon.svg'),
                  ],
                ),

                SizedBox(height: 12),

                /// Best seller items
                SizedBox(
                  height: h * 0.14,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(items.length, (index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                createRoute(
                                  widget: CategoryDetailScreen(
                                    item: CategoryModel(
                                      name: 'Fresh Prawn Ceviche',
                                      imagePath: 'assets/images/prawn.png',
                                      type: 'Meals',
                                      description:
                                          'Tortilla Chips With Toppins',
                                      price: '12.99',
                                    ),
                                  ),
                                ),
                              );
                            },
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
                                    color: AppColors.orangeBase.withOpacity(
                                      0.9,
                                    ),
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
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                SizedBox(height: 12),
                ImageCarouselCard(w: w - 20),
                SizedBox(height: 12),

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
                CustomGridCard(),
                SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
