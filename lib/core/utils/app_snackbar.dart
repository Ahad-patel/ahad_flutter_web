library app_snack_bars;

import 'package:ahad_ayna_interview_project/common_libs.dart';
import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/core/routes/navigation_service.dart';
import 'package:ahad_ayna_interview_project/core/config/app_dimens.dart';
import 'package:gap/gap.dart';

enum AlertType { info, success, warning, error }

class AppSnackBars {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBar({
    required AlertType alertType,
    required String message,
    BuildContext? buildContext,
    String? title,
  }) {
    var context = buildContext ?? NavigationService().getNavigationContext();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    var backgroundColors = {
      AlertType.info: Colors.grey,
      AlertType.success: Colors.green,
      AlertType.warning: Colors.orangeAccent,
      AlertType.error: Colors.redAccent,
    };

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: _SnackBarWidget(
          alertTitle: title ?? '',
          alertMessage: message,
          alertType: alertType,
        ),
        showCloseIcon: true,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: context.getHeight - (2 * kToolbarHeight),
        ),
        padding: EdgeInsets.zero,
        dismissDirection: DismissDirection.startToEnd,
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColors[alertType],
        elevation: 4,
      ),
    );
  }
}

class _SnackBarWidget extends StatelessWidget {
  final String alertTitle;
  final String alertMessage;
  final AlertType alertType;
  const _SnackBarWidget(
      {super.key,
      required this.alertMessage,
      this.alertTitle = '',
      this.alertType = AlertType.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (alertTitle.isNotEmpty)
            Text(
              alertTitle,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          const Gap(4),
          Text(
            alertMessage,
            maxLines: null,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
