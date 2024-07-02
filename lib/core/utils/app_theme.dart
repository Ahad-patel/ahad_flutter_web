import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';

class AppThemeData {
  AppThemeData._();

  static final ThemeData theme = ThemeData(
    primarySwatch: AppColors.primaryMaterialCo,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    unselectedWidgetColor: AppColors.grey78,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.primary.withOpacity(0.2),
    ),
    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.primary,
      alignment: Alignment.topLeft,
      textColor: AppColors.white,
      offset: Offset(5, 0),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.scaffoldBackground,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      titleTextStyle: TextStyle(
        fontSize: 14,
        color: AppColors.white,
      ),
    ),
  );
}
