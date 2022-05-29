part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationEventSignedIn extends AuthenticationEvent {
  const AuthenticationEventSignedIn();

  @override
  List<Object?> get props => [];
}
