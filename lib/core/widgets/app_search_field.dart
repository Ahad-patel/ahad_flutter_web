import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/core/config/app_assets.dart';
import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/core/extensions/text_style_extension.dart';
import 'package:ahad_ayna_interview_project/core/config/app_dimens.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_size.dart';
import 'package:ahad_ayna_interview_project/core/widgets/app_text_form_field.dart';

class AppSearchField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool filled;
  final EdgeInsetsGeometry contentPadding;
  final bool showSuffix;
  final bool enabled;
  final Color? borderColor;
  final VoidCallback? onCameraSearch;
  final void Function(String? value)? onSearchChange;
  final VoidCallback? onTap;
  final void Function(String?)? onChange;
  final void Function(String?)? onSubmit;
  final bool readOnly;
  final ValueKey? tag;
  final Widget? suffix;
  final Color? bgColor;
  final double? height;

  const AppSearchField(
      {required this.hint,
      super.key,
      this.controller,
      this.bgColor,
      this.tag,
      this.height,
      this.filled = true,
      this.enabled = true,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      this.showSuffix = false,
      this.onCameraSearch,
      this.onSearchChange,
      this.onChange,
      this.onSubmit,
      this.onTap,
      this.suffix,
      this.readOnly = false,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? '',
      child: Material(
        // color: AppColors.yellow,
        type: MaterialType.transparency,
        child: AppTextFormField(
          controller: controller,
          filled: filled,
          showBorder: true,
          readOnly: readOnly,
          maxLines: 1,
          height: height,
          hintTextStyle: context.md14.withGrey78,
          onChange: onChange,
          onSubmit: onSubmit,
          fillColor: bgColor ?? AppColors.black.withOpacity(0.5),
          borderColor: borderColor,
          onTap: onTap,
          suffixIconSize: showSuffix
              ? const BoxConstraints(
                  maxHeight: AppDimens.imageSize24,
                )
              : null,
          suffixIcon: showSuffix ? suffix : null,
          prefixIconSize: const BoxConstraints(
            maxHeight: AppDimens.imageSize24,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.space16),
            child: Icon(
              Icons.search,
              color: AppColors.grey78,
              size: context.h(AppDimens.imageSize15),
            ),
          ),
          contentPadding: contentPadding,
          hint: hint,
        ),
      ),
    );
  }
}
