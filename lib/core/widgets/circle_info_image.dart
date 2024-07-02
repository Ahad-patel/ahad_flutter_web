import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/common_libs.dart';

class CircleInfoImage extends StatelessWidget {
  final String assetImage;

  const CircleInfoImage({required this.assetImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.w(65),
      width: context.w(65),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: context.w(65),
          width: context.w(65),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(assetImage),
          ),
        ),
      ),
    );
  }
}
