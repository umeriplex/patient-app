import 'package:flutter/material.dart';
import 'package:patient_app/utils/extensions/magins.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

class PaymentButton extends StatelessWidget {
  final String image;
  final String name;
  final String? desc;
  final bool isSelected;
  final double? imagePadding;
  final VoidCallback onPressed;

  const PaymentButton({super.key, required this.image, required this.name, this.desc, required this.isSelected, required this.onPressed, this.imagePadding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AD.of(context).w24, vertical: AD.of(context).h15),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.white100,
          borderRadius: BorderRadius.circular(AD.of(context).r10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : AppColors.white100,
                shape: BoxShape.circle,
              ),
            ),

            AD.of(context).w24.pw,
            Container(
              height: AD.of(context).h45,
              width: AD.of(context).w45 * 5,
              padding: EdgeInsets.all(imagePadding ?? 10),
              decoration: BoxDecoration(
                color: AppColors.black300.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(image),
            ),

            AD.of(context).w24.pw,
            desc == null ?
            Text(name, style: TextStyles.subtitle1.copyWith(fontSize: 24),) :
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyles.subtitle1.copyWith(fontSize: 24),),
                Text(desc!, style: TextStyles.bodyText1,),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
