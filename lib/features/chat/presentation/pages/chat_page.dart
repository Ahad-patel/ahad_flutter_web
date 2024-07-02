import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahad_ayna_interview_project/common_libs.dart';
import 'package:ahad_ayna_interview_project/core/widgets/app_icon_button.dart';
import 'package:ahad_ayna_interview_project/core/widgets/app_text_form_field.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/chat.dart';
import 'package:ahad_ayna_interview_project/features/chat/presentation/manager/chat/chat_bloc.dart';
import 'package:ahad_ayna_interview_project/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatPage extends StatefulWidget {
  final String? roomId;
  const ChatPage({super.key, this.roomId});

  @override
  State<ChatPage> createState() => _ChatPageState(roomId: roomId);
}

class _ChatPageState extends State<ChatPage> {
  _ChatPageState({this.roomId});
  var controller = TextEditingController();
  late Uri wsUrl;
  String? roomId;
  late ChatBloc chatBloc;
  late WebSocketChannel channel;

  // ValueNotifier<List<Chat>> messages = ValueNotifier([]);

  Future<void> _init() async {
    print("Init called");
    wsUrl = Uri.parse('wss://echo.websocket.org/');
    channel = WebSocketChannel.connect(wsUrl);
    await channel.ready;

    channel.stream.listen((event) {
      print("event from stream $event");
      try {
        json.decode(event);
        jsonDecode(event);
        var chat = Chat.fromJson(event);
        chatBloc.add(AddMessageEvent(chat: chat));
      } catch (e) {
        print("Invalid json format $e");
      }
    });
  }

  @override
  void initState() {
    chatBloc = ChatBloc();
    _init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print(GoRouterState.of(context).uri.queryParameters);
    roomId ??= GoRouterState.of(context).uri.queryParameters['roomId'];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void _onSendClicked(String value) {
    print("on Send clicked");
    if (value.trim().isEmpty) return;
    var sendMessage = Chat(
        id: const Uuid().v1(),
        roomId: roomId ?? '',
        message: value,
        sentByMe: true);

    channel.sink.add(sendMessage.toJson());
    // chatBloc.add(SendMessageEvent(message: sendMessage));

    var receiveMessage = sendMessage.copyWith(
        id: const Uuid().v1(),
        sentByMe: false,
        createdAt: DateTime.now().add(const Duration(milliseconds: 100)));
    // print(sendMessage.toJson());
    // print(receiveMessage.toJson());
    Future.delayed(const Duration(milliseconds: 100));

    channel.sink.add(receiveMessage.toJson());
    controller.clear();
    // chatBloc.add(SendMessageEvent(message: receiveMessage));
  }

  // void _addDataToList(String event) {
  //   try {
  //     messages.value.add(Chat.fromJson(event));
  //     messages.value.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
  //     messages.notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => chatBloc,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimens.defaultBorderRadius))),
          backgroundColor: AppColors.black.withOpacity(0.5),
          toolbarHeight: context.h(75),
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.borderRadius40),
                border: Border.all(color: AppColors.grey78)),
            padding: EdgeInsets.all(AppDimens.space5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/500/500'),
                  maxRadius: AppDimens.borderRadius20,
                ),
                Gap(AppDimens.space5),
                Text(
                  roomId ?? '',
                  style: context.sm12.withGreyD9,
                ),
                Gap(AppDimens.space16),
              ],
            ),
          ),
          actions: [
            // ElevatedButton(
            //     onPressed: () {
            //       NavigationService()
            //           .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
            //     },
            //     child: Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: context.isPC
                          ? AppDimens.defaultMaxWidth
                          : double.infinity),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        BlocBuilder<ChatBloc, ChatState>(
                          bloc: chatBloc
                            ..add(GetAllChatsEvent(roomId: roomId!)),
                          builder: (context, state) {
                            if (state.responseState == ResponseState.loading) {
                              return const CircularProgressIndicator();
                            }
                            if (state.responseState == ResponseState.success) {
                              return Expanded(
                                child: ListView.builder(
                                  reverse: true,
                                  shrinkWrap: true,
                                  itemCount: state.room!.chats.length,
                                  itemBuilder: (context, index) {
                                    return ChatBubble(
                                        chat: state.room!.chats[index]);
                                  },
                                ),
                              );
                            }
                            return const Center(
                              child: Text('No previous messages'),
                            );
                          },
                        ),
                        AppTextFormField(
                          controller: controller,
                          hint: "Write a message ...",
                          fillColor: AppColors.black.withOpacity(0.5),
                          filled: true,
                          onSubmit: (value) {
                            _onSendClicked(controller.text);
                          },
                          suffixIcon: AppIconButton.send(
                            iconColor: AppColors.primary,
                            onPressed: () {
                              _onSendClicked(controller.text);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
