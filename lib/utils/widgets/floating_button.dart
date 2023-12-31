import 'package:flutter/material.dart';
import 'package:trafficnepal/utils/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Image.asset(
        "assets/img/siren.png",
        height: 30,
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
