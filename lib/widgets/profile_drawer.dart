import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/Model/drawer_model.dart';
import 'package:food_delivery_ui_kit/pages/order_screens/order_screen.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/icon_box.dart';

class ProfileDrawer extends StatefulWidget {
  final bool showDrawer;
  const ProfileDrawer({super.key, required this.showDrawer});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  final List<DrawerItem> drawerItems = [
    DrawerItem(
      iconPath: 'assets/svg/order.svg',
      title: 'My Orders',
      screen: OrderScreen(),
    ),
    DrawerItem(
      iconPath: 'assets/svg/profile.svg',
      title: 'My Profile',
      screen: OrderScreen(),
    ),
    DrawerItem(
      iconPath: 'assets/svg/location.svg',
      title: 'Delivery Address',
      screen: OrderScreen(),
    ),
    DrawerItem(
      iconPath: 'assets/svg/wallet.svg',
      title: 'Payment Methods',
      screen: OrderScreen(),
    ),
    DrawerItem(
      iconPath: 'assets/svg/contact.svg',
      title: 'Contact Us',
      screen: OrderScreen(),
    ),
    DrawerItem(
      iconPath: 'assets/svg/chat.svg',
      title: 'Help & FAQs',
      screen: OrderScreen(),
    ),
    DrawerItem(
      iconPath: 'assets/svg/setting.svg',
      title: 'Settings',
      screen: OrderScreen(),
    ),
    DrawerItem(
      iconPath: 'assets/svg/logout.svg',
      title: 'Log Out',
      screen: OrderScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    final panelWidth = (w * 0.78).clamp(260.0, 420.0);

    return AnimatedSlide(
      offset: widget.showDrawer ? Offset.zero : const Offset(1, 0),
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: panelWidth - 20,
          height: h,
          child: Material(
            elevation: 12,
            color: AppColors.orangeBase,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60),
              bottomLeft: Radius.circular(60),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2025/04/28/19/59/female-model-9565629_640.jpg',
                      ),
                    ),
                    title: SizedBox(
                      child: CustomText(
                        text: 'john smith',
                        color: AppColors.font2,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: SizedBox(
                      child: CustomText(
                        text: 'Loremipsum@email.com',
                        color: AppColors.font2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Expanded(
                    child: ListView.separated(
                      itemCount: drawerItems.length,
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.font2),
                      itemBuilder: (context, index) {
                        final item = drawerItems[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              createRoute(widget: item.screen),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                IconBox(
                                  height: 30,
                                  width: 30,
                                  imagePath: item.iconPath,
                                ),
                                SizedBox(width: 20),
                                CustomText(
                                  text: item.title,
                                  color: AppColors.font2,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
