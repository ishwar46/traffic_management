import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:remittonepal/presentation/home/ui/home_page.dart';
import 'package:remittonepal/presentation/login/login_page.dart';

import 'package:remittonepal/utils/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  final onBoardData = [
    const OnBoardModel(
        title: "Traffic Light Syncronization",
        description: "Traffic light syncronization for smooth traffic flow.",
        imgUrl: "assets/B1.png"),
    const OnBoardModel(
        title: "Live Tracking",
        description:
            "Live tracking of traffic light and traffic flow for better traffic management.",
        imgUrl: "assets/B2.png"),
    const OnBoardModel(
        title: "Traffic Management",
        description: "Traffic management for better traffic flow.",
        imgUrl: "assets/B1.png")
  ];
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: OnBoard(
          imageWidth: 300,
          onBoardData: onBoardData,
          pageController: _pageController,
          titleStyles: const TextStyle(
            color: AppColors.textBlack,
            fontSize: 25,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: const TextStyle(
            fontSize: 16,
            color: AppColors.textLight,
          ),
          pageIndicatorStyle: const PageIndicatorStyle(
            width: 100,
            inactiveColor: AppColors.primaryColor,
            activeColor: Colors.red,
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          nextButton: OnBoardConsumer(builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            isLastPage = state.page == onBoardData.length - 1;
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: 300,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isLastPage ? "Get Started " : "Next",
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
          skipButton: OnBoardConsumer(
            builder: (context, ref, child) {
              final state = ref.watch(onBoardStateProvider);
              isLastPage = state.page == onBoardData.length - 1;
              return InkWell(
                  onTap: () => _skipOnboarding(),
                  child: Text(
                    isLastPage ? " " : "Skip",
                    style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ));
            },
          ),
          onSkip: () {
            _skipOnboarding();
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      _onDone();
    }
  }

  void _skipOnboarding() {
    _pageController.jumpToPage(onBoardData.length - 1);
  }

  void _onDone() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
