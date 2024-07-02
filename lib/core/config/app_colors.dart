import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Colors.amber;
  static const Color secondary = Color(0XFF4BDAB4);
  static const Color error = Colors.red;
  static const Color fontColor = Colors.black;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color yellow = Colors.yellow;
  static const Color brown = Colors.brown;
  static const Color scaffoldBackground = Color(0xFF1B1E21);
  static const Color chatBackground = Color(0xFF202527);
  static const Color grey78 = Color(0xFF787878);
  static const Color greyD9 = Color(0xFFD9D9D9);
  static const Color red = Colors.red;
  static const Color transparent = Colors.transparent;

  /// Primary material color of the app
  static MaterialColor primaryMaterialCo =
      MaterialColor(Colors.amber.value, _getSwatch(AppColors.primary));

  /// Primary swatch of the application
  static Map<int, Color> _getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    const lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}
