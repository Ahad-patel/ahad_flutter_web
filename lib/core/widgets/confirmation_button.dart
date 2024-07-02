import 'package:flutter/cupertino.dart';
import 'package:ahad_ayna_interview_project/common_libs.dart';
import 'package:ahad_ayna_interview_project/core/widgets/app_button.dart';

class ConfirmationButtons extends StatelessWidget {
  final String positiveText;
  final String negativeText;
  final VoidCallback? onPositiveClick;
  final VoidCallback? onNegativeClick;
  final double fontSize;
  final double elevatedFontSize;
  final double? height;

  const ConfirmationButtons(
      {super.key,
      this.positiveText = 'Submit',
      this.negativeText = 'Cancel',
      this.onPositiveClick,
      this.fontSize = 16,
      this.elevatedFontSize = 16,
      this.height,
      this.onNegativeClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            buttonType: ButtonType.elevated,
            height: height ?? context.w(AppDimens.defaultButtonHeight),
            onTap: onPositiveClick,
            buttonName: positiveText,
            fontSize: elevatedFontSize,
          ),
        ),
        const Gap(AppDimens.space15),
        Expanded(
          child: AppButton(
            buttonType: ButtonType.outline,
            height: height ?? context.w(AppDimens.defaultButtonHeight),
            onTap: onNegativeClick,
            buttonName: negativeText,
            // outlineColor: AppColors.brown,
            // fontColor: AppColors.brown,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
