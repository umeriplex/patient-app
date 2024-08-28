import 'package:flutter/material.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_text_styles.dart';

// Custom Button Class
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final Color backgroundColor;
  final Color textColor;
  final Color? textOverrideColor;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.backgroundColor = AppColors.buttonColor,
    this.textColor = AppColors.termsAndConditions,
    this.borderRadius = 8.0,
    this.textOverrideColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: isOutlined ?
      OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor, side: BorderSide(color: textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyles.button.copyWith(color: AppColors.white100),
        ),
      ) :
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          elevation: 0,

        ),
        child: Text(
          text,
          style: TextStyles.button.copyWith(color: textColor),
        ),
      ),
    );
  }
}