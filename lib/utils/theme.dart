// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartftraffic/utils/app_colors.dart';

var lightTheme = ThemeData(
  fontFamily: GoogleFonts.nunito().fontFamily,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    //display large
    displayLarge: TextStyle(
      color: AppColors.textBlack,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      color: AppColors.textLight,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    // labelMedium: TextStyle(
    //   fontSize: FontSizeManager.f18,
    //   fontWeight: FontWeightManager.semiBold,
    // ),
    labelSmall: TextStyle(
      fontSize:15,
      fontWeight: FontWeight.w500,
      color: AppColors.blackLight,
    ),

    labelLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.textBlack,
    ),

    // titleLarge: TextStyle(
    //   fontSize: FontSizeManager.f16,
    //   fontWeight: FontWeightManager.medium,
    //   color: fontDarkPrimary,
    // ),

    // titleMedium: TextStyle(
    //   fontSize: FontSizeManager.f12,
    //   color: fontDarkPrimary,
    //   fontWeight: FontWeightManager.medium,
    // ),
    // titleSmall: TextStyle(
    //   fontSize: FontSizeManager.f10,
    //   fontWeight: FontWeightManager.bold,
    //   letterSpacing: 0.5,
    //   color: primaryRedColor,
    // ),
  ),
);
