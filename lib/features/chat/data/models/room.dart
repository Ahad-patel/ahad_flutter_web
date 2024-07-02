import 'package:hive/hive.dart';
import 'dart:convert';

import 'chat.dart';

part 'room.g.dart';

@HiveType(typeId: 0)
class Room extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? userId;

  @HiveField(2, defaultValue: <Chat>[])
  List<Chat> chats;

  @HiveField(3)
  final DateTime? createdAt;

  Room({
    this.id,
    this.userId,
    this.chats = const <Chat>[],
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
        userId: json["userId"],
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "chats": chats != null && chats!.isNotEmpty
            ? List<dynamic>.from(chats!.map((x) => x.toJson()))
            : null,
        "createdAt":
            createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      };
}
