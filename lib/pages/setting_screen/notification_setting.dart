import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool generalNotification = true;
  bool sound = true;
  bool soundCall = true;
  bool vibrate = false;
  bool spacialOffer = false;
  bool payment = true;
  bool promoOffers = false;
  bool cashback = false;
  bool orderUpdates = true;
  bool deliveryUpdates = true;
  bool newRestaurantAlerts = false;

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Notification Settings'),
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

                        //
                        _buildSwitchTile(
                          title: "General Notifications",
                          value: generalNotification,
                          onChanged: (val) {
                            setState(() => generalNotification = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Sound",
                          value: sound,
                          onChanged: (val) {
                            setState(() => sound = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Sound for Calls",
                          value: soundCall,
                          onChanged: (val) {
                            setState(() => soundCall = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Vibrate",
                          value: vibrate,
                          onChanged: (val) {
                            setState(() => vibrate = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Special Offers",
                          value: spacialOffer,
                          onChanged: (val) {
                            setState(() => spacialOffer = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Payments",
                          value: payment,
                          onChanged: (val) {
                            setState(() => payment = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Promo and discount",
                          value: promoOffers,
                          onChanged: (val) {
                            setState(() => promoOffers = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Cashback",
                          value: cashback,
                          onChanged: (val) {
                            setState(() => cashback = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Order Updates",
                          value: orderUpdates,
                          onChanged: (val) {
                            setState(() => orderUpdates = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "Delivery Update",
                          value: deliveryUpdates,
                          onChanged: (val) {
                            setState(() => deliveryUpdates = val);
                          },
                        ),
                        _buildSwitchTile(
                          title: "New Restaurant",
                          value: newRestaurantAlerts,
                          onChanged: (val) {
                            setState(() => newRestaurantAlerts = val);
                          },
                        ),

                        SizedBox(height: h * 0.05),
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

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Column(
      children: [
        ListTile(
          title: CustomText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          trailing: Transform.scale(
            scale: 0.7,
            child: Switch(
              value: value,
              activeColor: AppColors.orangeBase,
              inactiveTrackColor: AppColors.orange2,
              thumbColor: WidgetStatePropertyAll(AppColors.font2),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
