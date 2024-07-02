part of 'websocket_bloc.dart';

@immutable
sealed class WebsocketEvent {}

class WebSocketInit extends WebsocketEvent {}
