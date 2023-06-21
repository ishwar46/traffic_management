import 'package:flutter/material.dart';
import 'package:remittonepal/presentation/OnBoarding/onboarding_screen.dart';
import 'package:remittonepal/presentation/login/login_page.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String splashRoute = "/splash";
  static const String profileRoute = "/profile";
  static const String signupRoute = "/signup";
  static const String homepageRoute = "/homePage";
  static const String faqRoute = "/faqpage";
  static const String onboardingRoute = "/onboardingRoute";
  static const String changepassRoute = "/changepassRoute";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      /// case register:
      // return MaterialPageRoute(builder: (_) => RegisterScreen());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
