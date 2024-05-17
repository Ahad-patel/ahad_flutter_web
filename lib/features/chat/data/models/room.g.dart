// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomAdapter extends TypeAdapter<Room> {
  @override
  final int typeId = 0;

  @override
  Room read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Room(
      id: fields[0] as String?,
      chats: (fields[1] as List).cast<Chat>(),
      createdAt: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Room obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chats)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
