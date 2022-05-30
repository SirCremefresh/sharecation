part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationStateInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationStateSignedIn extends AuthenticationState {
  @override
  List<Object> get props => [];
}
