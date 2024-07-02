import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_size.dart';

extension TextStyleExtension on BuildContext {
  TextStyle get h1 =>
      Theme.of(this).textTheme.displayMedium!.copyWith(fontSize: 60);

  TextStyle get h2 => Theme.of(this).textTheme.displayMedium!.copyWith(
        fontSize: _getResponsiveFontSize(this, baseFontSize: 50),
      );

  TextStyle get h45 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 44));

  TextStyle get h34 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 33));

  TextStyle get h32 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 31));

  TextStyle get h28 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 27));

  TextStyle get xs10 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 9));

  TextStyle get sm12 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 11));

  TextStyle get md14 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 13));

  TextStyle get lg16 => Theme.of(this)
      .textTheme
      .headlineLarge!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 15));

  TextStyle get xl18 => Theme.of(this)
      .textTheme
      .headlineMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 17));

  TextStyle get x20 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 19));

  TextStyle get x22 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 21));

  TextStyle get x24 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 23));

  TextStyle get x26 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 25));

  double _getResponsiveFontSize(BuildContext context,
      {double baseFontSize = 16.0}) {
    double responsiveFontSize = baseFontSize * (context.isTablet ? 1.3 : 1);
    return responsiveFontSize;
  }
}

extension StyleExtension on TextStyle {
  /// Font colors
  TextStyle get withBlack => copyWith(color: AppColors.black);

  TextStyle get withWhite => copyWith(color: AppColors.white);

  TextStyle get withPrimary => copyWith(color: AppColors.primary);

  TextStyle get withSecondary => copyWith(color: AppColors.secondary);

  TextStyle get withGrey78 => copyWith(color: AppColors.grey78);

  TextStyle get withGreyD9 => copyWith(color: AppColors.greyD9);

  TextStyle get withRed => copyWith(color: AppColors.red);

  TextStyle withOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return copyWith(color: color?.withOpacity(opacity));
  }

  /// font weight
  TextStyle get weigh300 => copyWith(fontWeight: FontWeight.w300);

  TextStyle get weigh400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get weigh500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get weigh600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get weigh700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle get weigh800 => copyWith(fontWeight: FontWeight.w800);

  TextStyle get weigh900 => copyWith(fontWeight: FontWeight.w900);

  /// font height
  TextStyle get height1 => copyWith(height: 1);

  TextStyle get height2 => copyWith(height: 2);

  TextStyle get height1_5 => copyWith(height: 1.5);

  TextStyle get height1_6 => copyWith(height: 1.6);

  TextStyle get height1_7 => copyWith(height: 1.7);

  TextStyle get height1_8 => copyWith(height: 1.8);

  TextStyle get height1_9 => copyWith(height: 1.9);

  /// text decoration
  TextStyle get primaryLineTrough => copyWith(
      decoration: TextDecoration.lineThrough,
      decorationColor: AppColors.primary);

  TextStyle get greyLineTrough => copyWith(
      decoration: TextDecoration.lineThrough,
      decorationColor: AppColors.grey78);

  TextStyle get blackUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: AppColors.black);

  TextStyle get primaryUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: AppColors.primary);

  TextStyle get whiteUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: AppColors.white);

  TextStyle get yellowUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: AppColors.yellow);

  TextStyle createFont(Size screenSize,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    double scale = 1;
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    if (shortestSide > tabletXl) {
      scale = 1.2;
    } else if (shortestSide > tabletLg) {
      scale = 1.1;
    } else {
      scale = 1;
    }
    sizePx *= scale;
    if (heightPx != null) {
      heightPx *= scale;
    }
    return this.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : letterSpacing,
        fontWeight: weight);
  }
}
