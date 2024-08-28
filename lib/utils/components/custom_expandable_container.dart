import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/utils/extensions/magins.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';
import 'custom_expanded_section.dart';

class ExpandableContainer extends StatelessWidget {
  final bool isExpanded;
  final String title;
  final String desc;
  final VoidCallback onTap;
  const ExpandableContainer({super.key, required this.isExpanded, required this.title, required this.desc, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: AD.of(context).w30, vertical: AD.of(context).h20),
          margin: EdgeInsets.symmetric(horizontal: AD.of(context).w45),
          width: double.maxFinite,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
              color: AppColors.white100,
              borderRadius: !isExpanded ? BorderRadius.circular(AD.of(context).r10) : BorderRadius.only(topLeft: Radius.circular(AD.of(context).r10), topRight: Radius.circular(AD.of(context).r10),)
          ),
          child: Row(
            children: [
              Expanded(child: Text(title, style: TextStyles.subtitle1,)),
              InkWell(
                onTap: onTap,
                child: Icon(
                  isExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        ExpandedSection(
          expand: isExpanded,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AD.of(context).w30,),
            margin: EdgeInsets.symmetric(horizontal: AD.of(context).w45),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.white100,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AD.of(context).r10), bottomRight: Radius.circular(AD.of(context).r10),),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 1,
                  color: AppColors.black300.withOpacity(0.2),
                ),
                AD.of(context).h20.ph,
                Text(desc, style: TextStyles.bodyText1,),
                AD.of(context).h20.ph,
              ],
            ),
          ),
        )
      ],
    );
  }
}
