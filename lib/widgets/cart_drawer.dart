import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/Model/cart_model.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class CartDrawer extends StatefulWidget {
  final bool showDrawer;
  const CartDrawer({super.key, required this.showDrawer});

  @override
  State<CartDrawer> createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  final List<CartModel> cartItems = [
    CartModel(
      imagePath: 'assets/images/broccoli.png',
      title: 'Broccoli Lasagna',
      price: '13',
    ),
    CartModel(
      imagePath: 'assets/images/strawberyShake.png',
      title: 'Strawberry Shake',
      price: '12',
    ),
    CartModel(
      imagePath: 'assets/images/chicken.png',
      title: 'Chicken',
      price: '3',
    ),
  ];

  final double deliveryFee = 2.00;
  final double taxRate = 0.08;

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    final panelWidth = (w * 0.78).clamp(260.0, 420.0);

    final subtotal = _calculateSubtotal();
    final tax = subtotal * taxRate;
    final total = subtotal + tax + deliveryFee;

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
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/cart.svg',
                        height: 26,
                        width: 26,
                        fit: BoxFit.contain,
                        color: AppColors.font2,
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        text: 'Cart',
                        fontSize: 24,
                        color: AppColors.font2,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Divider(color: AppColors.font2),

                  Center(
                    child: CustomText(
                      text: 'You have ${cartItems.length} items in the cart',
                      color: AppColors.font2,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 10),

                  //
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartItems.length,
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.font2),
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              Container(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  color: AppColors.orange2,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.orangeBase,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(cartItem.imagePath),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: cartItem.title,
                                      color: AppColors.font2,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 2),
                                    CustomText(
                                      text: '\$${cartItem.price}',
                                      color: AppColors.font2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Divider(color: AppColors.font2),

                  //
                  Column(
                    children: [
                      _buildSummaryRow(
                        'Subtotal',
                        '\$${subtotal.toStringAsFixed(2)}',
                      ),
                      SizedBox(height: 6),
                      _buildSummaryRow(
                        'Tax & Fees',
                        '\$${tax.toStringAsFixed(2)}',
                      ),
                      SizedBox(height: 6),
                      _buildSummaryRow(
                        'Delivery',
                        '\$${deliveryFee.toStringAsFixed(2)}',
                      ),
                      SizedBox(height: 10),
                      Divider(color: AppColors.font2),
                      SizedBox(height: 10),
                      _buildSummaryRow(
                        'Total',
                        '\$${total.toStringAsFixed(2)}',
                        isBold: true,
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateSubtotal() {
    return cartItems.fold(0.0, (sum, item) => sum + double.parse(item.price));
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          color: AppColors.font2,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: isBold ? 18 : 16,
        ),
        CustomText(
          text: value,
          color: AppColors.font2,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: isBold ? 18 : 16,
        ),
      ],
    );
  }
}
