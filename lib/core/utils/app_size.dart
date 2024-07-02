import 'package:flutter/material.dart';

extension CustomSize on BuildContext {
  /// Dynamic Height based on screen pixel ration
  Size get size => MediaQuery.of(this).size;
  double h(num height) => height * (size.height / 690);

  /// Dynamic Width based on screen pixxel ration
  double w(num width) => width * (size.width / 360);
  bool get isTablet => size.width > 550;
  bool get isPC => size.width > 1200;

  double get getHeight => size.height;
  double get getWidth => size.width;

}
