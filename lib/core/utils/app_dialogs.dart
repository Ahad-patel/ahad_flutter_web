import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/common_libs.dart';
import 'package:ahad_ayna_interview_project/core/routes/navigation_service.dart';
import 'package:ahad_ayna_interview_project/core/widgets/circle_info_image.dart';
import 'package:ahad_ayna_interview_project/core/widgets/confirmation_button.dart';
import 'package:ahad_ayna_interview_project/core/widgets/widgets.dart';
import 'package:gap/gap.dart';

class AppDialogs {
  static void planDialog({required Widget child}) {
    showGeneralDialog(
        context: NavigationService().getNavigationContext(),
        pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        });
  }

  static void customGeneralDialog({
    required String rightButtonText,
    required void Function()? rightButtonOnTap,
    String? leftButtonText,
    void Function(bool)? onDismissDialog,
    void Function()? leftButtonOnTap,
    Color? topIconColor = AppColors.primary,
    Color? titleColor = AppColors.black,
    Color? descriptionColor = AppColors.black,
    String? topIconPath,
    String? titleText,
    String? descriptionText,
    Widget? child,
  }) {
    showGeneralDialog(
      context: NavigationService().getNavigationContext(),
      barrierDismissible: true,
      barrierLabel:
          MaterialLocalizations.of(NavigationService().getNavigationContext())
              .modalBarrierDismissLabel,
      barrierColor: AppColors.black.withOpacity(0.1),
      pageBuilder: (context, animation, secondaryAnimation) {
        return PopScope(
          canPop: true,
          onPopInvoked: onDismissDialog,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Center(
              child: Material(
                color: AppColors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: context.w(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(20),
                    vertical: context.w(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      topIconPath == null
                          ? const SizedBox()
                          : Column(
                              children: [
                                CircleInfoImage(assetImage: topIconPath),
                                const Gap(10),
                              ],
                            ),
                      titleText == null
                          ? const SizedBox()
                          : Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: context.w(25)),
                                      child: Text(
                                        titleText,
                                        textAlign: TextAlign.center,
                                        style: context.xl18.weigh500
                                            .copyWith(color: titleColor),
                                      ),
                                    ),
                                    const Gap(12),
                                  ],
                                ),
                              ],
                            ),
                      descriptionText == null
                          ? const SizedBox()
                          : Text(
                              descriptionText,
                              textAlign: TextAlign.center,
                              style: context.sm12.weigh400
                                  .copyWith(color: descriptionColor),
                            ),
                      const Gap(12),
                      if (child != null) ...[
                        child,
                        const Gap(20),
                      ],
                      leftButtonText == null
                          ? AppButton(
                              buttonType: ButtonType.elevated,
                              onTap: rightButtonOnTap,
                              buttonName: rightButtonText,
                              fontSize: 16,
                              fontColor: AppColors.white,
                              buttonColor: AppColors.primary,
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    buttonType: ButtonType.outline,
                                    onTap: leftButtonOnTap,
                                    buttonName: leftButtonText,
                                    fontSize: 15,
                                    fontColor: AppColors.brown,
                                    outlineColor: AppColors.brown,
                                  ),
                                ),
                                const Gap(12),
                                Expanded(
                                  child: AppButton(
                                    buttonType: ButtonType.elevated,
                                    onTap: rightButtonOnTap,
                                    buttonName: rightButtonText,
                                    fontSize: 15,
                                    fontColor: AppColors.white,
                                    buttonColor: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 0), end: Offset.zero);
        }

        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  static Future<dynamic> confirmationDialog({
    required String confirmationTitle,
    String positiveText = 'Yes',
    String negativeText = 'No',
    VoidCallback? onPositiveClick,
    VoidCallback? onNegativeClick,
  }) {
    return showGeneralDialog(
      context: NavigationService().getNavigationContext(),
      barrierDismissible: true,
      barrierLabel:
          MaterialLocalizations.of(NavigationService().getNavigationContext())
              .modalBarrierDismissLabel,
      barrierColor: AppColors.black.withOpacity(0.1),
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: context.w(20)),
          // shape: SquircleDecoration().sqShape,
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              confirmationTitle,
              textAlign: TextAlign.center,
              style: context.lg16.weigh500,
            ),
          ),
          actions: [
            ConfirmationButtons(
              negativeText: negativeText,
              positiveText: positiveText,
              onNegativeClick: onNegativeClick ??
                  () {
                    NavigationService().pop();
                  },
              onPositiveClick: onPositiveClick,
            ),
          ],
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 0), end: Offset.zero);
        }

        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }
}
