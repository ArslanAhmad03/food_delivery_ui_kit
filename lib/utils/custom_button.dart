import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final VoidCallback? onPressed;
  final TextStyle textStyle;
  final bool loading;
  final bool disabled;

  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.orangeBase,
    this.textColor = AppColors.font2,
    this.onPressed,
    this.borderRadius = 0.010,
    this.height = 0.06,
    this.textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    this.loading = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final isEnabled = onPressed != null && !disabled && !loading;
    print('h ${h * borderRadius}');
    return Container(
      height: h * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(h * borderRadius),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: h * 0.012,
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return Color.lerp(backgroundColor, Colors.white, 0.3);
            }
            return backgroundColor;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return textColor.withOpacity(0.6);
            }
            return textColor;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(h * borderRadius),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: Center(
          child: loading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.font2,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: textStyle.copyWith(
                    color: isEnabled ? textColor : textColor.withOpacity(0.7),
                  ),
                ),
        ),
      ),
    );
  }
}
