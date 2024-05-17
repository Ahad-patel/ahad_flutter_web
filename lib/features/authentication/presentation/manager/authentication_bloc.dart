import 'dart:async';

import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:ahad_ayna_interview_project/core/utils/common_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(const AuthenticationState(responseState: ResponseState.initial)) {
    on<LoginEvent>(onUserLogin);
    on<RegisterEvent>(onUserRegister);
    on<LogoutEvent>(onUserLogout);
  }

  Future<void> onUserLogin(
      LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit.call(state.copyWith(responseState: ResponseState.loading));
    try {
      await User.login(event.user);
      emit.call(state.copyWith(responseState: ResponseState.success));
    } catch (e) {
      emit.call(state.copyWith(
          responseState: ResponseState.failure, message: e.toString()));
    }
  }

  Future<void> onUserRegister(
      RegisterEvent event, Emitter<AuthenticationState> emit) async {
    emit.call(state.copyWith(responseState: ResponseState.loading));
    try {
      await User.register(event.user);
      emit.call(state.copyWith(responseState: ResponseState.success));
    } catch (e) {
      emit.call(state.copyWith(
          responseState: ResponseState.failure, message: e.toString()));
    }
  }

  FutureOr<void> onUserLogout(
      LogoutEvent event, Emitter<AuthenticationState> emit) {}
}
