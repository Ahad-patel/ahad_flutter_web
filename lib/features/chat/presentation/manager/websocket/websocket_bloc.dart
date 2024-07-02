import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc() : super(WebsocketInitial()) {
    on<WebsocketEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
