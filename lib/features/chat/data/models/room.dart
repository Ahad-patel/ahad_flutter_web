import 'package:hive/hive.dart';
import 'dart:convert';

import 'chat.dart';

part 'room.g.dart';

@HiveType(typeId: 0)
class Room extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1, defaultValue: [])
  final List<Chat> chats;

  @HiveField(2)
  final DateTime? createdAt;

  Room({
    this.id,
    this.chats = const [],
    this.createdAt,
  });

  Room copyWith({
    String? id,
    List<Chat>? chats,
    DateTime? createdAt,
  }) =>
      Room(
        id: id ?? this.id,
        chats: chats ?? this.chats,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        id: json["id"],
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "chats": List<dynamic>.from(chats.map((x) => x.toMap())),
        "createdAt":
            createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      };
}
