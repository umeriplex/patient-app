import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:patient_app/features/auth/view/login_view.dart';
import 'package:patient_app/features/auth/view/register_view.dart';
import 'package:patient_app/features/home/model/appointment_model.dart';
import 'package:patient_app/features/home/view/home_view.dart';
import 'package:patient_app/features/home/view/service_summary_view.dart';
import 'package:patient_app/features/splash/view/welcome_view.dart';

import '../../features/splash/view/splash_view.dart';
import 'names.dart';

class AppRoutes{
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: Names.initial,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Names.welcomed,
      page: () => const WelcomeView(),
    ),

    GetPage(
      name: Names.signUp,
      page: () => const RegisterView(),
    ),

    GetPage(
      name: Names.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Names.home,
      page: () => const HomeView(),
    ),

    GetPage(
      name: Names.appointmentDone,
      page: () {
        final model = Get.arguments as AppointmentModel;
        return ServiceSummary(
          appointment: model,
        );
      } ,
    ),
  ];
}