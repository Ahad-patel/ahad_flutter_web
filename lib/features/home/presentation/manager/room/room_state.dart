part of 'room_bloc.dart';

class RoomState extends Equatable {
  final ResponseState responseState;
  final String? message;
  final List<Room> rooms;
  final Room? createdRoom;
  const RoomState(
      {this.responseState = ResponseState.initial,
      this.message,
      this.rooms = const [],
      this.createdRoom});

  @override
  List<Object?> get props => [responseState, message, rooms];

  RoomState copyWith({
    ResponseState? responseState,
    String? message,
    List<Room>? rooms,
    Room? createdRoom,
  }) {
    return RoomState(
      responseState: responseState ?? this.responseState,
      message: message,
      rooms: rooms ?? this.rooms,
      createdRoom: createdRoom ?? this.createdRoom,
    );
  }
}
