import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChatBubble extends StatelessWidget {
  Chat chat;
  ChatBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (chat.sentByMe ? Alignment.topRight : Alignment.topLeft),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!chat.sentByMe) ...[
              CircleAvatar(
                maxRadius: 12.h,
                backgroundColor: AppColors.primary.withOpacity(0.2),
                child: Icon(Icons.person),
              ),
              Gap(3),
            ],
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: (chat.sentByMe ? Colors.grey.shade200 : Colors.white),
              ),
              padding: EdgeInsets.all(16),
              child: Text(chat.message),
            ),
          ],
        ),
      ),
    );
  }
}
