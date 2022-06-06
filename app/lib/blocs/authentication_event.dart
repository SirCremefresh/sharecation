part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signedInEvent({required String userId}) = _SignedInEvent;
  const factory AuthenticationEvent.signedOutEvent() = _SignedOutEvent;
}

