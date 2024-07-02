import 'package:flutter/material.dart';
import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/core/config/app_font_style.dart';
import 'package:ahad_ayna_interview_project/core/extensions/text_style_extension.dart';
import 'package:ahad_ayna_interview_project/core/config/app_dimens.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_extensions.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/room.dart';
import 'package:gap/gap.dart';

class RoomListItem extends StatelessWidget {
  final Room room;
  final VoidCallback? onTap;
  final String? networkImage;
  final bool selected;
  const RoomListItem(
      {super.key,
      required this.room,
      this.onTap,
      this.networkImage,
      this.selected = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: selected
                  ? const Border(
                      left: BorderSide(color: AppColors.primary, width: 2))
                  : null),
          child: ListTile(
            contentPadding: const EdgeInsets.all(AppDimens.space16),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    networkImage ?? 'https://picsum.photos/500/500'),
                maxRadius: AppDimens.borderRadius30),
            title: Text(
              '${room.id}',
              style: context.md14.withWhite.height2,
            ),
            subtitle: Text(
              room.chats.firstOrNull?.message ?? '',
              style: context.sm12.withWhite.withOpacity(0.5),
            ),
            trailing: Text(room.createdAt!.formatDate),
          ),
        ));
  }
}
