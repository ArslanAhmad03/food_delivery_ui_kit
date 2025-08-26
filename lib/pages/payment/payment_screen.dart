import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui_kit/pages/payment/add_card.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedIndex;

  final List<Map<String, String>> wallets = [
    {"image": "assets/svg/wallet.svg", "type": "**** **** **** **43"},
    {"image": "assets/svg/mac.svg", "type": "Apple Pay"},
    {"image": "assets/svg/paypal.svg", "type": "Paypal"},
    {"image": "assets/svg/google_play.svg", "type": "Google Play"},
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Payment Method'),

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
                          itemCount: wallets.length,
                          separatorBuilder: (context, index) =>
                              Divider(color: AppColors.orange2),
                          itemBuilder: (context, index) {
                            final wallet = wallets[index];
                            return ListTile(
                              leading: SizedBox(
                                height: 30,
                                width: 30,
                                child: SvgPicture.asset(
                                  wallet["image"]!,
                                  color: AppColors.orangeBase,
                                ),
                              ),
                              title: CustomText(
                                text: wallet["type"]!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
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

                        SizedBox(height: h * 0.3),

                        //
                        CustomButton(
                          text: 'Add New Card',
                          // borderRadius: 0.04,
                          onPressed: () {
                            Navigator.push(
                              context,
                              createRoute(widget: AddCard()),
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
