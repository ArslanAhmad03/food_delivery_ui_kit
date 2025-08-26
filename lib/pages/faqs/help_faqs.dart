import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/sliver_top_row.dart';

class HelpFaqs extends StatefulWidget {
  const HelpFaqs({super.key});

  @override
  State<HelpFaqs> createState() => _HelpFaqsState();
}

class _HelpFaqsState extends State<HelpFaqs> {
  final List<Map<String, String>> faqs = [
    {
      "question": "How can I place an order?",
      "answer":
          "Browse your favorite restaurants, add items to your cart, and proceed to checkout. Select your payment method and confirm the order.",
    },
    {
      "question": "Can I cancel my order after placing it?",
      "answer":
          "Yes, you can cancel your order before it is accepted by the restaurant. Go to 'My Orders' and click on Cancel Order.",
    },
    {
      "question": "What payment methods are available?",
      "answer":
          "We accept Cash on Delivery, Credit/Debit Cards, and popular e-wallets.",
    },
    {
      "question": "How can I track my order?",
      "answer":
          "Once your order is confirmed, you can track its status in real-time from the 'My Orders' section.",
    },
    {
      "question": "What should I do if my order is incorrect?",
      "answer":
          "If you receive the wrong items, please contact our support team through the app. We’ll resolve it as quickly as possible.",
    },
    {
      "question": "What payment methods are available?",
      "answer":
          "We accept Cash on Delivery, Credit/Debit Cards, and popular e-wallets.",
    },
    {
      "question": "How can I track my order?",
      "answer":
          "Once your order is confirmed, you can track its status in real-time from the 'My Orders' section.",
    },
    {
      "question": "What should I do if my order is incorrect?",
      "answer":
          "If you receive the wrong items, please contact our support team through the app. We’ll resolve it as quickly as possible.",
    },
  ];

  List<bool> expanded = [];

  @override
  void initState() {
    super.initState();
    expanded = List.generate(faqs.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverTopRow(title: 'Help & FAQs'),
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
                        SizedBox(height: h * 0.03),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: faqs.length,
                          separatorBuilder: (context, index) =>
                              Divider(color: AppColors.orange2),
                          itemBuilder: (context, index) {
                            final faq = faqs[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: CustomText(
                                    text: faq["question"]!,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  trailing: Icon(
                                    expanded[index]
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: AppColors.orangeBase,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      expanded[index] = !expanded[index];
                                    });
                                  },
                                ),
                                if (expanded[index])
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.05,
                                      vertical: h * 0.01,
                                    ),
                                    child: CustomText(
                                      text: faq["answer"]!,
                                      fontSize: 16,
                                      color: AppColors.font,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: h * 0.06),
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
