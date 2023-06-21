import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remittonepal/presentation/login/login_page.dart';
import 'package:remittonepal/routes.dart';
import 'package:remittonepal/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: Routes.onboardingRoute,
      onGenerateRoute: Routes.generateRoute,
      home: const LoginPage(),
    );
  }
}
