import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppFS {
  /// Default font family
  static const String defaultFontOfApp = 'Poppins';
  static String get _defaultFontFamily => defaultFontOfApp;

  static TextStyle get defaultHeaderStyle =>
      style(16, fontWeight: FontWeight.w600);

  static TextStyle style(
    double size, {
    Color? fontColor,
    String? fontFamily,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    double? lineHeight,
    double? letterSpacing,
  }) {
    const defaultFontColor = AppColors.fontColor;
    const defaultFontWeight = FontWeight.w400;
    const defaultLetterSpacing = 0.5;

    TextStyle appTextStyle(double fontSize, {double? height}) => TextStyle(
        fontFamily: fontFamily ?? _defaultFontFamily,
        fontSize: fontSize.h,
        height: height ?? lineHeight,
        decoration: decoration,
        decorationColor: fontColor ?? defaultFontColor,
        letterSpacing: letterSpacing ?? defaultLetterSpacing,
        fontWeight: fontWeight ?? defaultFontWeight,
        color: fontColor ?? defaultFontColor);

    switch (size) {
      case 0:
        return appTextStyle(0, height: 0);
      case 6:
        return appTextStyle(7);
      case 8:
        return appTextStyle(9); //7.5.sp
      case 10:
        return appTextStyle(9.6);

      case 12:
        return appTextStyle(12);

      case 14:
        return appTextStyle(13);

      case 16:
        return appTextStyle(14);

      case 18:
        return appTextStyle(16);

      case 20:
        return appTextStyle(18);

      case 22:
        return appTextStyle(20.4);

      case 24:
        return appTextStyle(22.6);

      case 26:
        return appTextStyle(24);

      case 32:
        return appTextStyle(26.4);
      case 40:
        return appTextStyle(36);

      default:
        return appTextStyle(size);
    }
  }
}
