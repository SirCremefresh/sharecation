part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initialState() = _InitialState;

  const factory AuthenticationState.unAuthenticatedState() =
      _UnAuthenticatedState;

  const factory AuthenticationState.signedInState({required String userId}) =
      _SignedInState;
}
