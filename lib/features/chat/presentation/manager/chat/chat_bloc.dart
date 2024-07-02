import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ahad_ayna_interview_project/core/config/hive_db.dart';
import 'package:ahad_ayna_interview_project/core/utils/common_functions.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/chat.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/room.dart';
import 'package:hive/hive.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState(responseState: ResponseState.initial)) {
    on<GetAllChatsEvent>(getAllChats);
    on<AddMessageEvent>(sendMessage);
  }

  Future<void> getAllChats(
      GetAllChatsEvent event, Emitter<ChatState> emit) async {
    emit.call(state.copyWith(responseState: ResponseState.loading));

    var roomList = AppLocalDB.roomBox;
    var room = roomList.get(event.roomId);
    emit.call(state.copyWith(
        responseState: ResponseState.success,
        room: room,
        chatList: room?.chats));
  }

  Future<void> sendMessage(
      AddMessageEvent event, Emitter<ChatState> emit) async {
    try {
      var roomList = AppLocalDB.roomBox;
      var room = roomList.get(event.chat.roomId);

      room!.chats = [...room.chats, event.chat];

      if (room.chats.length > 1) {
        room.chats.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }

      room.save();

      print("messages updated ${event.chat.message}");
      print("All chats ${room.chats}");

      emit.call(state.copyWith(
          responseState: ResponseState.success,
          chatList: [...room.chats],
          room: room));
    } catch (e) {
      print("error on adding message $e");
    }
  }
}
