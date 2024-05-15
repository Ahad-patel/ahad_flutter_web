import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  const AppTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  InputBorder get outlineBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      );

  InputBorder get errorOutlineBorder => OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(10),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: outlineBorder,
          enabledBorder: outlineBorder,
          focusedBorder: outlineBorder,
          errorBorder: errorOutlineBorder,
          focusedErrorBorder: errorOutlineBorder),
    );
  }
}
