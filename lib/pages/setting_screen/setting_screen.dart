import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/pages/setting_screen/notification_setting.dart';
import 'package:food_delivery_ui_kit/pages/setting_screen/reset_pass.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<Map<String, String>> contactOptions = [
    {"title": "Notification Setting", "icon": "assets/svg/notification.svg"},
    {"title": "Password Setting", "icon": "assets/svg/password_icon.svg"},
    {"title": "Delete Account", "icon": "assets/svg/profile.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Settings'),
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
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contactOptions.length,
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
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        createRoute(
                                          widget: NotificationSettings(),
                                        ),
                                      );
                                    } else if (index == 1) {
                                      Navigator.push(
                                        context,
                                        createRoute(widget: ResetPass()),
                                      );
                                    } else {
                                      print('delete');
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: h * 0.6),
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
