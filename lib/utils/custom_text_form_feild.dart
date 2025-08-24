import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final VoidCallback? toggleObscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixChild;
  final void Function(String)? onChanged;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.toggleObscureText,
    this.keyboardType,
    this.validator,
    this.suffixChild,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? _displayedErrorText;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(_onControllerChanged);
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    if (_displayedErrorText != null &&
        (widget.controller?.text.isNotEmpty ?? false)) {
      setState(() {
        _displayedErrorText = null;
      });
    }
    widget.onChanged?.call(widget.controller?.text ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: widget.label, fontWeight: FontWeight.w600),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: AppColors.orange2,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            readOnly: widget.readOnly,
            cursorColor: AppColors.yellowBase,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.font,
            ),
            onChanged: (value) {
              if (widget.controller != null) {
                _onControllerChanged();
              } else {
                widget.onChanged?.call(value);
              }
            },
            validator: (value) {
              final errorFromValidator = widget.validator?.call(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _displayedErrorText = errorFromValidator;
                  });
                }
              });
              return errorFromValidator;
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: InputBorder.none,
              hintText: widget.hintText,

              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
              ),
              suffixIcon: widget.toggleObscureText != null
                  ? IconButton(
                      icon: Icon(
                        widget.obscureText
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: AppColors.font,
                        size: 18,
                      ),
                      onPressed: widget.toggleObscureText,
                    )
                  : widget.suffixChild,
            ),
          ),
        ),
        if (_displayedErrorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 8),
            child: Text(
              _displayedErrorText!,
              style: const TextStyle(fontSize: 12, color: AppColors.orangeBase),
            ),
          ),
      ],
    );
  }
}
