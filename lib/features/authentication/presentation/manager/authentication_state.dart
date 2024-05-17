part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final ResponseState responseState;
  final String? message;

  const AuthenticationState({
    this.responseState = ResponseState.initial,
    this.message,
  });

  @override
  List<Object?> get props => [responseState, message];

  AuthenticationState copyWith({
    ResponseState? responseState,
    String? message,
  }) {
    return AuthenticationState(
      responseState: responseState ?? this.responseState,
      message: message,
    );
  }
}
