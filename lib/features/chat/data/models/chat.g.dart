// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatAdapter extends TypeAdapter<Chat> {
  @override
  final int typeId = 1;

  @override
  Chat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chat(
      id: fields[0] as String?,
      roomId: fields[1] as String,
      message: fields[2] as String,
      sentByMe: fields[3] as bool,
      createdAt: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Chat obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.roomId)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.sentByMe)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
