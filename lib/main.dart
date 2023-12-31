import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:trafficnepal/presentation/OnBoarding/onboarding_screen.dart';
import 'package:trafficnepal/presentation/home/splash_screen.dart';
import 'package:trafficnepal/presentation/home/ui/automatic.dart';
import 'package:trafficnepal/presentation/home/ui/home_page.dart';
import 'package:trafficnepal/presentation/screens/maps.dart';
import 'package:trafficnepal/routes.dart';
import 'package:trafficnepal/utils/theme.dart';
import 'presentation/home/ui/parking_page.dart';
import 'presentation/login/login_page.dart';
import 'utils/app_colors.dart';

Future<void> main() async {
  EasyLoading.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor));
  await Firebase.initializeApp();
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    FirebaseCrashlytics.instance.app.setAutomaticDataCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }
  runApp(
    EasyDynamicThemeWidget(child: const MyApp()),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.black38
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.transparent
    ..indicatorColor = AppColors.primaryColor
    ..textStyle = const TextStyle(
      color: Colors.white,
    )
    ..userInteractions = false
    ..fontSize = 12
    ..indicatorSize = 30.0
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SmartTrafficNepal',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      //initialRoute: MyRoutes.onboardingRoute,
      home: SplashScreen(),
      routes: {
        // "/": (context) => Dashboard(),
        MyRoutes.changepassRoute: (context) => const LoginPage(),
        MyRoutes.onboardingRoute: (context) => const OnBoardingScreen(),
        MyRoutes.homepageRoute: (context) => Dashboard(),
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.mapsRoute: (context) => MapScreen(),
        MyRoutes.automaticRoute: (context) => AutomaticTrigger(),
        MyRoutes.slotRoute: (context) => SlotLot(),
      },
    );
  }
}
