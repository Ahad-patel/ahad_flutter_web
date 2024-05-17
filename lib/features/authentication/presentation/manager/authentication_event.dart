part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final User user;

  LoginEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class RegisterEvent extends AuthenticationEvent {
  final User user;

  RegisterEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
