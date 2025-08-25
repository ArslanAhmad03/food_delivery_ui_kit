import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/notification_model.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/icon_box.dart';

class NotifyDrawer extends StatefulWidget {
  final bool showDrawer;
  const NotifyDrawer({super.key, required this.showDrawer});

  @override
  State<NotifyDrawer> createState() => _NotifyDrawerState();
}

class _NotifyDrawerState extends State<NotifyDrawer> {
  final List<NotificationModel> notifications = [
    NotificationModel(
      iconPath: 'assets/svg/spoons.svg',
      title: 'We have added a product you might like.',
      onTap: () {
        print('We have added a product you might like.');
      },
    ),
    NotificationModel(
      iconPath: 'assets/svg/heart.svg',
      title: 'One of your favorite is on promotion.',
      onTap: () {
        print('One of your favorite is on promotion.');
      },
    ),
    NotificationModel(
      iconPath: 'assets/svg/order.svg',
      title: 'Your order has been delivered',
      onTap: () {
        print('Your order has been delivered');
      },
    ),
    NotificationModel(
      iconPath: 'assets/svg/onBoard03.svg',
      title: 'The delivery is on his way',
      onTap: () {
        print('The delivery is on his way');
      },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/notification.svg',
                        height: 28,
                        width: 28,
                        fit: BoxFit.contain,
                        color: AppColors.font2,
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        text: 'Notifications',
                        fontSize: 24,
                        color: AppColors.font2,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Divider(color: AppColors.font2),

                  SizedBox(height: 10),

                  //
                  Expanded(
                    child: ListView.separated(
                      itemCount: notifications.length,
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.font2),
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return InkWell(
                          onTap: notification.onTap,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                IconBox(
                                  height: 30,
                                  width: 30,
                                  imagePath: notification.iconPath,
                                ),
                                SizedBox(width: 20),
                                SizedBox(
                                  height: 36,
                                  width: 120,
                                  child: CustomText(
                                    text: notification.title,
                                    color: AppColors.font2,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
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
