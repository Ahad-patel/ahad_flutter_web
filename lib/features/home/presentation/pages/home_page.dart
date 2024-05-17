import 'package:ahad_ayna_interview_project/core/routes/app_route_keys.dart';
import 'package:ahad_ayna_interview_project/core/routes/navigation_service.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_dimens.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_snackbar.dart';
import 'package:ahad_ayna_interview_project/core/utils/common_functions.dart';
import 'package:ahad_ayna_interview_project/features/home/presentation/manager/room/room_bloc.dart';
import 'package:ahad_ayna_interview_project/features/home/presentation/widgets/room_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = RoomBloc();
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Flutter Web socket'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  NavigationService().pushNamedAndRemoveUntil(
                      AppRoutes.login, (route) => false);
                },
                child: Icon(Icons.logout))
          ],
        ),
        bottomNavigationBar: BlocListener<RoomBloc, RoomState>(
          listener: (context, state) {
            if (state.responseState == ResponseState.created) {
              AppSnackBars.showSnackBar(
                  alertType: AlertType.success, message: "New Room Created");
              context.goNamed(AppRoutes.chat,
                  queryParameters: {"roomId": state.createdRoom!.id});
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.space10),
            child: ElevatedButton(
              onPressed: () async {
                bloc.add(const CreateRoomEvent());

                // var chat =
                //     Chat(roomId: room.id!, message: "Testing", sentByMe: true);
                // rooms.values.toList().first.chats.addAll([
                //   chat,
                //   chat.copyWith(sentByMe: false, message: "another Messgage")
                // ]);
                //
                // rooms.values.toList().firstWhere((element) =>
                //     element.id == '6f205880-9d49-1fd4-ba6b-ef9876fbee72');
                // // rooms.values.toList().first.chats.add(chat);
                // print(rooms.values);
              },
              child: Text('Start Chatting'),
            ),
          ),
        ),
        body: BlocBuilder<RoomBloc, RoomState>(
          bloc: bloc..add(GetAllRoomsEvent()),
          // listener: (context, state) {
          //   // TODO: implement listener
          // },
          builder: (context, state) {
            if (state.responseState == ResponseState.failure) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state.responseState == ResponseState.success) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.rooms.length,
                  itemBuilder: (context, index) {
                    return RoomListItem(
                        networkImage:
                            'https://picsum.photos/500/${100 * index}/',
                        onTap: () {
                          context.goNamed(AppRoutes.chat, queryParameters: {
                            "roomId": state.rooms[index].id
                          });
                        },
                        room: state.rooms[index]);
                  },
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
