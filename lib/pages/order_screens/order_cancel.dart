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
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  height: h * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.font2,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 20,
                      right: 20,
                      bottom: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: TextField(
                              controller: otherController,
                              maxLines: 3,
                              style: TextStyle(
                                color: AppColors.orangeBase,
                                fontSize: 18,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Write your reason here...",
                                hintStyle: TextStyle(
                                  color: AppColors.orangeBase,
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],

                        SizedBox(height: w * 0.2),

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
                              Navigator.push(
                                context,
                                createRoute(widget: OrderCancelled()),
                              );
                            });
                          },
                        ),

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
