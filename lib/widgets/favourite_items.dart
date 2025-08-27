import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class FavouriteItems extends StatelessWidget {
  const FavouriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(isShow: false, title: 'Favourites'),

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
                      children: [
                        CustomText(
                          text: "It's time to buy your favorite dish.",
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.orangeBase,
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 13,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/burger01.png',
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 12),

                                    //
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Delicious Burger $index',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'A tasty burger with fresh ingredients and amazing flavor.',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            '\$9.${index}0',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.orangeBase,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //
                                    IconButton(
                                      onPressed: () {
                                        print('Add to cart: Item $index');
                                      },
                                      icon: Icon(
                                        Icons.add_shopping_cart,
                                        color: AppColors.orangeBase,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
