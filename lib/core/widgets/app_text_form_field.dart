import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/core/extensions/text_style_extension.dart';
import 'package:ahad_ayna_interview_project/core/config/app_dimens.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_size.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? hintTextStyle;
  final TextStyle? fontTextStyle;
  final String? hint;
  final String? label;
  final String? initialValue;
  final String? value;
  final VoidCallback? onTap;
  final bool showBorder;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChange;
  final void Function(String? value)? onSubmit;
  final void Function(String? value)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? enable;
  final bool readOnly;
  final bool isDense;
  final bool obscureText;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputType keyboardType;
  final double borderRadius;
  final double? height;
  final bool? showCounter;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconSize;
  final BoxConstraints? prefixIconSize;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;

  const AppTextFormField({
    this.controller,
    super.key,
    this.hintTextStyle,
    this.fontTextStyle,
    this.hint,
    this.initialValue,
    this.value,
    this.onTap,
    this.showBorder = true,
    this.borderColor,
    this.height,
    this.validator,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.keyboardType = TextInputType.text,
    this.enable,
    this.readOnly = false,
    this.onChange,
    this.onSubmit,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconSize,
    this.prefixIconSize,
    this.filled = false,
    this.fillColor,
    this.borderRadius = AppDimens.borderRadius10,
    this.label,
    this.showCounter,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.textCapitalization = TextCapitalization.none,
    this.isDense = false,
  });

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor ?? AppColors.white),
      );

  // InputBorder get roundedInputBorder => OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(borderRadius),
  //     );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label ?? "",
            style: context.md14.withWhite.weigh500.height1_9,
          ),
        TextFormField(
          style: fontTextStyle ?? context.md14,
          enabled: enable,
          keyboardType: keyboardType,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onSaved: onSaved,
          readOnly: readOnly,
          textCapitalization: textCapitalization,
          // textInputAction: TextInputAction.send,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          onTap: onTap,
          controller: controller ?? TextEditingController(text: value),
          initialValue: initialValue,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            constraints: BoxConstraints(
              minHeight: height ?? context.h(AppDimens.inputFieldHeight),
              maxHeight: 10000,
            ),
            contentPadding: contentPadding,
            suffixIconConstraints: suffixIconSize,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconSize,
            hintText: hint,
            hintStyle: hintTextStyle ?? context.md14.withWhite.withOpacity(0.6),
            filled: filled,
            errorStyle: context.sm12.withRed,
            disabledBorder: showBorder ? outlineInputBorder : InputBorder.none,
            focusedErrorBorder:
                showBorder ? outlineInputBorder : InputBorder.none,
            enabledBorder: showBorder ? outlineInputBorder : InputBorder.none,
            border: showBorder ? outlineInputBorder : InputBorder.none,
            errorBorder: showBorder ? outlineInputBorder : InputBorder.none,
            focusedBorder: showBorder ? outlineInputBorder : InputBorder.none,
            fillColor: fillColor,
            // counterText: '',
          ),
          obscureText: obscureText,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
