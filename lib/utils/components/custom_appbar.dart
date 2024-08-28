import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_images.dart';
import '../app_text_styles.dart';

PreferredSizeWidget? myAppbar ({
  required String title,
  required BuildContext context,
  VoidCallback? onBack
}){
  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyles.headline2.copyWith(color: AppColors.white100),),
    backgroundColor: AppColors.primaryColor,
    leading: IconButton(
      icon: Image.asset(AppImages.appBarBack, height: AD.of(context).h30,),
      onPressed: () {
        onBack ?? Navigator.pop(context);
      },
    ),
  );
}