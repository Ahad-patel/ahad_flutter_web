part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

class GetAllChatsEvent extends ChatEvent {
  final String roomId;
  const GetAllChatsEvent({required this.roomId});

  @override
  List<Object?> get props => [roomId];
}

class AddMessageEvent extends ChatEvent {
  final Chat chat;

  const AddMessageEvent({required this.chat});
  @override
  List<Object?> get props => [chat];
}
