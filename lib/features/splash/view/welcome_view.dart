import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_app/core/routes/names.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_images.dart';
import 'package:patient_app/utils/extensions/magins.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/components/custom_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.doctor, // Your background image path
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black100.withOpacity(0.9),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  AppImages.namedLogo,
                  width: AD.of(context).w45*5,
                  height: AD.of(context).h45*5,
                ),

                Text(
                  'Welcome to Your Health Companion',
                  style: TextStyles.headline1.copyWith(color: Colors.white),
                  textAlign: TextAlign.start,
                ),

                AD.of(context).h10.ph,
                Text(
                  'Explore a Range of Features Designed to Empower You on Your Health Journey',
                  style: TextStyles.subtitle2.copyWith(color: Colors.white),
                  textAlign: TextAlign.start,
                ),

                AD.of(context).h45.ph,
                CustomButton(
                  text: 'Sign in as a Patient',
                  onPressed: () {
                    Get.toNamed(Names.signUp);
                  },
                ),

                AD.of(context).h10.ph,
                CustomButton(
                  text: 'Sign in as a Doctor',
                  onPressed: () {
                  },
                  isOutlined: true,
                  textColor: Colors.white,
                ),

                AD.of(context).h20.ph,
                TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    'Already have an Account? Login',
                    style: TextStyles.subtitle2.copyWith(color: AppColors.white100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
