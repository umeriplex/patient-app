import 'package:flutter/material.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_dimensions.dart';
import 'package:patient_app/utils/app_text_styles.dart';
import 'package:patient_app/utils/extensions/magins.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color filledColor;
  final FocusNode? focusNode;
  final TextInputAction? inputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const CustomTextField({
    super.key,
    this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.filledColor = AppColors.white100,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.inputAction
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (labelText != null && labelText != '') ? Text(
          labelText!,
          style: TextStyles.headline2.copyWith(fontSize: 16),
        ) : Container(),

        (labelText != null && labelText != '') ? 5.0.ph : Container(),
        TextField(
          focusNode: focusNode,
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: TextStyles.bodyText1,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: filledColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
            ),
          ),
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          textInputAction: inputAction ?? TextInputAction.done,
        ),
      ],
    );
  }
}
