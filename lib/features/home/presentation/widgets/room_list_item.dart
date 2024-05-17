import 'package:ahad_ayna_interview_project/core/config/app_font_style.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_extensions.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/room.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RoomListItem extends StatelessWidget {
  final Room room;
  final VoidCallback? onTap;
  final String? networkImage;
  const RoomListItem(
      {super.key, required this.room, this.onTap, this.networkImage});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          networkImage ?? 'https://picsum.photos/500/500/'),
                      maxRadius: 30,
                    ),
                    const Gap(16),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          room.id ?? '',
                          style: AppFS.style(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                room.createdAt?.formatDate ?? 'No Time',
                style: AppFS.style(12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
