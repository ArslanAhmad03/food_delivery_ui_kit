import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/Model/items_model.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

class CustomGridCard extends StatefulWidget {
  const CustomGridCard({super.key});

  @override
  State<CustomGridCard> createState() => _CustomGridCardState();
}

class _CustomGridCardState extends State<CustomGridCard> {
  final List<ItemsModel> itemsDetail = [
    ItemsModel(
      price: '30.0',
      imagepath: 'assets/images/burger.png',
      rating: '5.0',
      favourite: false,
    ),
    ItemsModel(
      price: '20.0',
      imagepath: 'assets/images/burger01.png',
      rating: '4.8',
      favourite: true,
    ),
    ItemsModel(
      price: '15.0',
      imagepath: 'assets/images/cheese.png',
      rating: '4.5',
      favourite: false,
    ),
    ItemsModel(
      price: '25.0',
      imagepath: 'assets/images/chicken.png',
      rating: '4.7',
      favourite: true,
    ),
    ItemsModel(
      price: '18.0',
      imagepath: 'assets/images/chips.png',
      rating: '4.2',
      favourite: false,
    ),
    ItemsModel(
      price: '22.0',
      imagepath: 'assets/images/coca_cola.png',
      rating: '4.4',
      favourite: true,
    ),
    ItemsModel(
      price: '12.0',
      imagepath: 'assets/images/grilled.png',
      rating: '3.9',
      favourite: false,
    ),
    ItemsModel(
      price: '28.0',
      imagepath: 'assets/images/ice_cream.png',
      rating: '4.6',
      favourite: true,
    ),
    ItemsModel(
      price: '27.0',
      imagepath: 'assets/images/lemon.png',
      rating: '4.8',
      favourite: false,
    ),
    ItemsModel(
      price: '14.0',
      imagepath: 'assets/images/noodle.png',
      rating: '3.8',
      favourite: true,
    ),
    ItemsModel(
      price: '23.0',
      imagepath: 'assets/images/noodles.png',
      rating: '4.5',
      favourite: false,
    ),
    ItemsModel(
      price: '17.0',
      imagepath: 'assets/images/pizza.png',
      rating: '4.1',
      favourite: true,
    ),
    ItemsModel(
      price: '40.0',
      imagepath: 'assets/images/rum.png',
      rating: '5.0',
      favourite: false,
    ),
    ItemsModel(
      price: '21.0',
      imagepath: 'assets/images/burger01.png',
      rating: '4.2',
      favourite: true,
    ),
    ItemsModel(
      price: '34.0',
      imagepath: 'assets/images/pizza.png',
      rating: '4.9',
      favourite: false,
    ),
  ];

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
        return Container(
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
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
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
        );
      },
    );
  }
}
