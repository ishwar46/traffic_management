import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smartftraffic/presentation/OnBoarding/onboarding_screen.dart';
import 'package:smartftraffic/routes.dart';
import 'package:smartftraffic/utils/theme.dart';
import 'presentation/login/login_page.dart';
import 'utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SmartTrafficNepal',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: MyRoutes.onboardingRoute,
      routes: {
        "/": (context) =>  LoginPage(),
       MyRoutes.changepassRoute: (context) =>  LoginPage(),
       MyRoutes.onboardingRoute: (context) =>  OnBoardingScreen(),

        
      },
    );
  }
}
