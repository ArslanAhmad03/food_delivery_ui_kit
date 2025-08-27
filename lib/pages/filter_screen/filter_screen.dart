import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/data/app_data.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/category_item.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<int> selectedMultiCategories = [];

  int selectedIndex = -1;

  RangeValues priceRange = RangeValues(10, 50);

  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Filter'),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.02),
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
                        //
                        CustomText(
                          text: "Categories",
                          fontSize: w * 0.06,
                          fontWeight: FontWeight.bold,
                        ),

                        // categories
                        SizedBox(height: h * 0.02),
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

                        Divider(color: AppColors.orange2),

                        //
                        SizedBox(height: h * 0.02),
                        CustomText(
                          text: "Sort by",
                          fontSize: w * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: h * 0.01),
                        Row(
                          children: [
                            CustomText(text: "Top Rated", fontSize: w * 0.045),
                            SizedBox(width: w * 0.03),
                            Row(
                              children: List.generate(5, (index) {
                                final starIndex = index + 1;
                                final isSelected = starIndex <= selectedRating;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedRating == starIndex) {
                                        selectedRating = 0;
                                      } else {
                                        selectedRating = starIndex;
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.008,
                                    ),
                                    child: Icon(
                                      isSelected
                                          ? Icons.star
                                          : Icons.star_border,
                                      size: w * 0.06,
                                      color: AppColors.yellowBase,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),

                        Divider(color: AppColors.orange2),

                        //
                        SizedBox(height: h * 0.02),
                        CustomText(text: "Categories"),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(multiCategories.length, (
                            index,
                          ) {
                            final isSelected = selectedMultiCategories.contains(
                              index,
                            );
                            return ChoiceChip(
                              avatarBorder: Border.all(),
                              label: CustomText(
                                text: multiCategories[index],
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: isSelected
                                    ? AppColors.font2
                                    : AppColors.orangeBase,
                              ),
                              selected: isSelected,
                              selectedColor: AppColors.orangeBase,
                              backgroundColor: AppColors.orange2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onSelected: (value) {
                                setState(() {
                                  if (isSelected) {
                                    selectedMultiCategories.remove(index);
                                  } else {
                                    selectedMultiCategories.add(index);
                                  }
                                });
                              },
                            );
                          }),
                        ),

                        SizedBox(height: h * 0.01),

                        Divider(color: AppColors.orange2),

                        SizedBox(height: h * 0.02),
                        CustomText(
                          text: "Price",
                          fontSize: w * 0.06,
                          color: AppColors.orangeBase,
                          fontWeight: FontWeight.bold,
                        ),

                        RangeSlider(
                          values: priceRange,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          activeColor: AppColors.orangeBase,
                          inactiveColor: AppColors.orange2,
                          labels: RangeLabels(
                            '\$${priceRange.start.round()}',
                            '\$${priceRange.end.round()}',
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              priceRange = values;
                            });
                          },
                        ),

                        SizedBox(height: h * 0.08),

                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 30,
                            width: w * 0.4,
                            child: CustomButton(
                              text: 'Apply',
                              borderRadius: 0.02,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: h * 0.04),
                      ],
                    ),
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
