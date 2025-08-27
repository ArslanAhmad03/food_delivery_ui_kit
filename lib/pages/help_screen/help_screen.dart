import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/contact_us/contact_us.dart';
import 'package:food_delivery_ui_kit/pages/faqs/help_faqs.dart';
import 'package:food_delivery_ui_kit/pages/help_screen/help_chat.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<Map<String, String>> helpOptions = [
    {"title": 'Help with the order', "subtitle": 'Support'},
    {"title": 'Faqs', "subtitle": 'General Information'},
    {"title": 'Contact Us', "subtitle": 'We Help You?'},
  ];
  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverTopRow(isShow: false, title: 'Help'),
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
                        SizedBox(height: h * 0.02),

                        CustomText(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor.",
                        ),
                        SizedBox(height: h * 0.02),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: helpOptions.length,
                          separatorBuilder: (context, index) =>
                              Divider(color: AppColors.orange2),
                          itemBuilder: (context, index) {
                            final helpOption = helpOptions[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: CustomText(
                                    text: helpOption["title"]!,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  subtitle: CustomText(
                                    text: helpOption["subtitle"]!,
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColors.orangeBase,
                                  ),
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        createRoute(widget: HelpChat()),
                                      );
                                    } else if (index == 1) {
                                      Navigator.push(
                                        context,
                                        createRoute(widget: HelpFaqs()),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        createRoute(widget: ContactUs()),
                                      );
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: h * 0.4),
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
