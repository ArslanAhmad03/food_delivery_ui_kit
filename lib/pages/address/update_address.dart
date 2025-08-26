import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_text_form_feild.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class UpdateAddress extends StatelessWidget {
  final String? type;
  final String? address;

  const UpdateAddress({super.key, this.type, this.address});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(
              title: type == null ? 'Add New Address' : 'Edit Address',
            ),

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

                        SizedBox(
                          width: w * 0.3,
                          height: w * 0.3,
                          child: SvgPicture.asset(
                            'assets/svg/home.svg',
                            color: AppColors.orangeBase,
                          ),
                        ),

                        SizedBox(height: h * 0.02),

                        CustomTextFormField(
                          label: 'Name',
                          hintText: type ?? 'Enter Address Name',
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: h * 0.022),

                        CustomTextFormField(
                          label: 'Address',
                          hintText: address ?? 'Enter Full Address',
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: h * 0.3),

                        CustomButton(
                          text: 'Apply',
                          borderRadius: 0.04,
                          onPressed: () {
                            Navigator.pop(context);
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
