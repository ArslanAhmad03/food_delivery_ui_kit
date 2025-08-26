import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/pages/address/update_address.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  int? selectedIndex;

  final List<Map<String, String>> addresses = [
    {
      "type": "Home",
      "address": "123 Main Street, Gulshan-e-Iqbal, Karachi, Pakistan",
    },
    {
      "type": "Office",
      "address": "2nd Floor, Techno Tower, Shahrah-e-Faisal, Karachi",
    },
    {
      "type": "Other",
      "address": "House 45, Block D, DHA Phase 6, Karachi, Sindh",
    },
    {
      "type": "Office",
      "address": "2nd Floor, Techno Tower, Shahrah-e-Faisal, Karachi",
    },
    {
      "type": "Other",
      "address": "House 45, Block D, DHA Phase 6, Karachi, Sindh",
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
            SliverTopRow(title: 'Delivery Address'),

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: h * 0.02),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: addresses.length,
                          separatorBuilder: (context, index) =>
                              Divider(color: AppColors.orange2),
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            return ListTile(
                              leading: SizedBox(
                                height: 30,
                                width: 30,
                                child: SvgPicture.asset(
                                  'assets/svg/home.svg',
                                  color: AppColors.orangeBase,
                                ),
                              ),
                              title: CustomText(
                                text: address["type"]!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitle: CustomText(
                                text: address["address"]!,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Radio<int>(
                                value: index,
                                groupValue: selectedIndex,
                                activeColor: AppColors.orangeBase,
                                onChanged: (value) {
                                  setState(() {
                                    selectedIndex = value;
                                  });
                                },
                              ),
                            );
                          },
                        ),

                        SizedBox(height: h * 0.1),

                        // Edit Selected Address Button
                        if (selectedIndex != null)
                          CustomButton(
                            text: 'Edit Selected Address',
                            borderRadius: 0.04,
                            onPressed: () {
                              Navigator.push(
                                context,
                                createRoute(
                                  widget: UpdateAddress(
                                    type: addresses[selectedIndex!]["type"]!,
                                    address:
                                        addresses[selectedIndex!]["address"]!,
                                  ),
                                ),
                              );
                            },
                          ),

                        SizedBox(height: h * 0.02),

                        // Add New Address Button
                        CustomButton(
                          text: 'Add New Address',
                          // orderRadius: 0.04,
                          onPressed: () {
                            Navigator.push(
                              context,
                              createRoute(widget: UpdateAddress()),
                            );
                          },
                        ),

                        SizedBox(height: h * 0.1),
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
