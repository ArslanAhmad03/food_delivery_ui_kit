import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  int? expandedIndex; // To track which tile is expanded

  final List<Map<String, String>> contactOptions = [
    {
      "title": "Customer Service",
      "icon": "assets/svg/cus_support.svg",
      "detail": "Call us at +92 300 1234567 or email support@yourapp.com",
    },
    {
      "title": "Website",
      "icon": "assets/svg/website_icon.svg",
      "detail": "Visit our website: www.yourapp.com",
    },
    {
      "title": "WhatsApp",
      "icon": "assets/svg/whatApp.svg",
      "detail": "Chat with us on WhatsApp: +92 300 1234567",
    },
    {
      "title": "Instagram",
      "icon": "assets/svg/instagram.svg",
      "detail": "Follow us @yourapp on Instagram",
    },
    {
      "title": "Facebook",
      "icon": "assets/svg/facebook_icon.svg",
      "detail": "Like our page: facebook.com/yourapp",
    },
    {
      "title": "Instagram",
      "icon": "assets/svg/instagram.svg",
      "detail": "Follow us @yourapp on Instagram",
    },
    {
      "title": "Facebook",
      "icon": "assets/svg/facebook_icon.svg",
      "detail": "Like our page: facebook.com/yourapp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Contact Us'),
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
                        SizedBox(height: h * 0.02),

                        //
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contactOptions.length,
                          separatorBuilder: (context, index) =>
                              Divider(color: AppColors.orange2),
                          itemBuilder: (context, index) {
                            final option = contactOptions[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: SvgPicture.asset(
                                      option["icon"]!,
                                      color: AppColors.orangeBase,
                                    ),
                                  ),
                                  title: CustomText(
                                    text: option["title"]!,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  trailing: Icon(
                                    expandedIndex == index
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: AppColors.orangeBase,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      expandedIndex = expandedIndex == index
                                          ? null
                                          : index;
                                    });
                                  },
                                ),
                                AnimatedCrossFade(
                                  firstChild: const SizedBox.shrink(),
                                  secondChild: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.05,
                                      vertical: h * 0.01,
                                    ),
                                    child: CustomText(
                                      text: option["detail"]!,
                                      fontSize: 16,
                                      color: AppColors.orangeBase,
                                    ),
                                  ),
                                  crossFadeState: expandedIndex == index
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 300),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: h * 0.2),
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
