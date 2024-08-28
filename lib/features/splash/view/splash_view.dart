import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_app/core/session/user_session.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'package:patient_app/utils/app_images.dart';
import 'package:patient_app/utils/messages.dart';
import '../../../core/routes/names.dart';
import '../../../utils/app_dimensions.dart';
import '../../auth/controller/auth_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.find<AuthController>().isUserLoggedIn().then((value) async {
        if(value){
          var user = UserSession().getUserDetails();
          if(user == null){
            await Get.find<AuthController>().signOut();
            showMessage("Session Expired.");
            Get.toNamed(Names.login);
          }
          Get.offNamed(Names.home);
        }else{
          Get.offNamed(Names.login);
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppImages.doctor), context);
    precacheImage(const AssetImage(AppImages.namedLogo), context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          AppImages.namedLogo,
          width: AD.of(context).w45*8,
          height: AD.of(context).h45*8,
        ),
      ),
    );
  }
}
