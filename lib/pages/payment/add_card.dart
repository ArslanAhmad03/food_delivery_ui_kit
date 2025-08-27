import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/payment/custom_atm_card.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_text_form_feild.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Add Card'),

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

                        CustomAtmCard(),

                        SizedBox(height: h * 0.04),

                        CustomTextFormField(
                          label: 'Card holder name',
                          hintText: 'john doe',
                        ),

                        SizedBox(height: h * 0.03),

                        CustomTextFormField(
                          label: 'Card Number',
                          hintText: '0000 0000 0000 0000',
                          keyboardType: TextInputType.number,
                        ),

                        SizedBox(height: h * 0.03),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 70,
                              child: CustomTextFormField(
                                label: 'Expiry Date',
                                hintText: '04/28',
                                keyboardType: TextInputType.number,
                              ),
                            ),

                            SizedBox(width: 12),

                            SizedBox(
                              width: 70,
                              child: CustomTextFormField(
                                label: 'CVV',
                                hintText: '000',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(width: 100),
                          ],
                        ),

                        SizedBox(height: h * 0.1),

                        //
                        CustomButton(
                          text: 'Save Card',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                        SizedBox(height: h * 0.04),
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
