import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patient_app/core/routes/names.dart';
import 'package:patient_app/utils/app_colors.dart';
import 'core/routes/routes.dart';
import 'di.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDi();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Patient App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.white100,
          surfaceTintColor: AppColors.white100,
          modalBackgroundColor: AppColors.white100,


        ),
      ),
      initialRoute: Names.initial,
      getPages: AppRoutes.getPages,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}