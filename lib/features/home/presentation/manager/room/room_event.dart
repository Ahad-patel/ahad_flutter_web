part of 'room_bloc.dart';

abstract class RoomEvent extends Equatable {
  const RoomEvent();
}

class GetAllRoomsEvent extends RoomEvent {
  @override
  List<Object?> get props => [];
}

class CreateRoomEvent extends RoomEvent {
  const CreateRoomEvent();
  @override
  List<Object?> get props => [];
}
