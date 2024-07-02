import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/core/config/app_dimens.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? imagePath;
  final IconData? iconData;
  final Widget? child;
  final Color? iconColor;
  final double? iconSize;
  final BoxConstraints? constraints;
  final bool shrinkButton;
  final EdgeInsetsGeometry? padding;

  const AppIconButton({
    this.imagePath,
    this.iconData,
    super.key,
    this.onPressed,
    this.child,
    this.shrinkButton = false,
    this.constraints,
    this.padding,
    this.iconSize,
    this.iconColor,
  });

  factory AppIconButton.share(
          {VoidCallback? onPressed, Color? iconColor, double? iconSize}) =>
      AppIconButton(
        iconData: Icons.share,
        iconColor: iconColor,
        iconSize: iconSize,
        onPressed: onPressed,
      );

  factory AppIconButton.send(
          {VoidCallback? onPressed, Color? iconColor, double? iconSize}) =>
      AppIconButton(
        iconData: Icons.send_rounded,
        iconColor: iconColor,
        iconSize: iconSize,
        onPressed: onPressed,
      );

/*
  factory AppIconButton.call(
          {VoidCallback? onPressed, Color? iconColor, double? iconSize}) =>
      AppIconButton(
        shrinkButton: true,
        imagePath: AppAssets.call,
        iconColor: iconColor,
        iconSize: iconSize,
        onPressed: onPressed,
      ); */

  // factory AppIconButton.back({
  //   VoidCallback? onPressed,
  //   Color? iconColor,
  //   double? iconSize,
  //   BoxConstraints? constraints,
  //   bool? shrinkButton,
  //   EdgeInsetsGeometry? padding,
  // }) =>
  //     AppIconButton(
  //       imagePath: AppAssets.backArrowIcon,
  //       iconColor: iconColor,
  //       iconSize: iconSize,
  //       padding: padding,
  //       shrinkButton: shrinkButton = false,
  //       constraints: constraints,
  //       onPressed: onPressed ?? () => NavigationService().pop(),
  //     );

  factory AppIconButton.text(
          {required String text,
          TextStyle? textStyle =
              const TextStyle(fontSize: 14, color: AppColors.grey78),
          VoidCallback? onPressed,
          Color? iconColor = AppColors.grey78,
          double? iconSize,
          BoxConstraints? constraints,
          EdgeInsetsGeometry? padding,
          bool selected = false,
          bool shrinkButton = false}) =>
      AppIconButton(
        iconColor: iconColor,
        iconSize: iconSize,
        padding: padding,
        shrinkButton: shrinkButton = false,
        constraints: constraints,
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: padding,
      constraints: constraints,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius10)),
        tapTargetSize: shrinkButton
            ? MaterialTapTargetSize.shrinkWrap
            : MaterialTapTargetSize.padded,
      ),
      icon: child ??
          Icon(
            iconData ?? Icons.arrow_back,
            color: iconColor,
            size: iconSize,
            // height: iconSize ?? 24,
            // width: iconSize ?? 24,
          ),
    );
  }
}
