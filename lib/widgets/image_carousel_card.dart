import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

class ImageCarouselCard extends StatefulWidget {
  final double w;

  const ImageCarouselCard({super.key, required this.w});

  @override
  State<ImageCarouselCard> createState() => _ImageCarouselCardState();
}

class _ImageCarouselCardState extends State<ImageCarouselCard> {
  final List<Map<String, String>> offerCard = [
    {'thumbnail': 'assets/images/onBoard01.png', 'off': '50'},
    {'thumbnail': 'assets/images/onBoard02.png', 'off': '20'},
    {'thumbnail': 'assets/images/onBoard03.png', 'off': '30'},
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: offerCard.length,
      itemBuilder: (context, index, realIndex) {
        final offerItem = offerCard[index];
        return Container(
          height: widget.w * 0.4,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: AppColors.font2,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFCCE4F6).withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(offerItem['thumbnail']!),
            ),
          ),
          child: Container(
            height: widget.w * 0.40,
            margin: EdgeInsets.only(right: widget.w * 0.45),
            decoration: BoxDecoration(
              color: AppColors.orangeBase,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFCCE4F6).withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Experience our\ndelicious new dish',
                    fontSize: 16,
                    color: AppColors.font2,
                    align: TextAlign.center,
                  ),
                  CustomText(
                    text: "${offerItem['off']}% OFF",
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: AppColors.font2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: widget.w * 0.4,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.9,
        onPageChanged: (index, reason) {},
      ),
    );
  }
}
