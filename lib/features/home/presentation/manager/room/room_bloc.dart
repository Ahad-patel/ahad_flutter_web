import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ahad_ayna_interview_project/core/config/hive_db.dart';
import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:ahad_ayna_interview_project/core/utils/common_functions.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/room.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc()
      : super(RoomState(responseState: ResponseState.initial, rooms: [])) {
    on<GetAllRoomsEvent>(getAllRooms);
    on<CreateRoomEvent>(createRoom);
  }

  Future<void> getAllRooms(
      GetAllRoomsEvent event, Emitter<RoomState> emit) async {
    emit.call(state.copyWith(responseState: ResponseState.loading));
    Box<Room> rooms = AppLocalDB.roomBox;
    var user = await User.getCurrentUser();

    List<Room> roomList =
        rooms.values.where((e) => e.userId == user!.id).toList();
    print(roomList);
    print(rooms.values.map((e) => e.toJson()).toList());
    print(user!.toJson());
    if (roomList.isNotEmpty) {
      // List<Room> list =
      //     rooms.values.where((e) => e.userId == user!.id).toList();

      roomList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      emit.call(state.copyWith(
          responseState: ResponseState.success, rooms: roomList));
      return;
    }
    emit.call(state.copyWith(
        responseState: ResponseState.failure, message: "No Rooms Found"));
  }

  Future<void> createRoom(
      CreateRoomEvent event, Emitter<RoomState> emit) async {
    try {
      var user = await User.getCurrentUser();
      var room = Room(
          id: const Uuid().v1(), userId: user!.id, createdAt: DateTime.now());
      Box<Room> rooms = AppLocalDB.roomBox;
      rooms.put(room.id, room);

      emit.call(state.copyWith(
          responseState: ResponseState.created,
          rooms: [...rooms.values],
          createdRoom: room));
    } catch (e) {
      emit.call(state.copyWith(
          responseState: ResponseState.failure, message: e.toString()));
    }
  }
}
