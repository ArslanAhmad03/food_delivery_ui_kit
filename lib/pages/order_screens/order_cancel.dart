import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/pages/order_screens/order_cancelled.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_button.dart';
import 'package:food_delivery_ui_kit/utils/custom_navigator.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class OrderCancel extends StatefulWidget {
  const OrderCancel({super.key});

  @override
  State<OrderCancel> createState() => _OrderCancelState();
}

class _OrderCancelState extends State<OrderCancel> {
  String? selectedReason;
  final TextEditingController otherController = TextEditingController();

  final List<String> reasons = [
    "Delivery is taking too long",
    "Wrong delivery address",
    "Found a better deal",
    "Changed my mind",
    "Food quality concerns",
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top Bar
            SliverTopRow(title: 'Cancel Order'),

            // Body
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.02),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.font2,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: h * 0.02),

                        Center(
                          child: CustomText(
                            text: 'Select a reason to cancel your order',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            align: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // List of Reasons
                        ...reasons.map((reason) {
                          return RadioListTile<String>(
                            title: CustomText(
                              text: reason,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            value: reason,
                            groupValue: selectedReason,
                            activeColor: AppColors.orangeBase,
                            controlAffinity: ListTileControlAffinity.trailing,
                            onChanged: (value) {
                              setState(() {
                                selectedReason = value;
                                otherController.clear();
                              });
                            },
                          );
                        }),

                        // Other Option
                        RadioListTile<String>(
                          title: CustomText(
                            text: 'Other',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          value: "Other",
                          groupValue: selectedReason,
                          activeColor: AppColors.orangeBase,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (value) {
                            setState(() {
                              selectedReason = value;
                            });
                          },
                        ),

                        // Text field for "Other"
                        if (selectedReason == "Other") ...[
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.orange2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: otherController,
                              maxLines: 3,
                              style: TextStyle(
                                color: AppColors.orangeBase,
                                fontSize: 18,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Others reason...",
                                hintStyle: TextStyle(
                                  color: AppColors.orangeBase,
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: h * 0.06),
                        ] else ...[
                          SizedBox(height: h * 0.2),
                        ],

                        SizedBox(height: h * 0.06),

                        // Submit Button
                        CustomButton(
                          text: 'Submit',
                          onPressed: () {
                            String finalReason = selectedReason ?? "";
                            if (finalReason == "Other") {
                              finalReason = otherController.text.trim();
                            }

                            if (finalReason.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Please select or enter a reason",
                                  ),
                                ),
                              );
                              return;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Reason Submitted: $finalReason"),
                                duration: Duration(milliseconds: 600),
                              ),
                            );

                            Future.delayed(Duration(milliseconds: 1200)).then((
                              _,
                            ) {
                              Navigator.pushReplacement(
                                context,
                                createRoute(widget: OrderCancelled()),
                              );
                            });
                          },
                        ),

                        SizedBox(height: h * 0.02),

                        //
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
