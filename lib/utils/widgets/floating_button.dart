import 'package:flutter/material.dart';
import 'package:smartftraffic/utils/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
