import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/blocs/main_bloc.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final MainBloc mainBloc;

  AuthenticationBloc({
    required this.mainBloc,
  }) : super(const AuthenticationState.initialState()) {
    on<AuthenticationEvent>((event, emit) {
      event.when(
        signedInEvent: (userId) {
          emit(AuthenticationState.signedInState(userId: userId));
          mainBloc.add(MainEvent.loadGroupsForUser(userId: userId));
        },
        signedOutEvent: () {
          emit(const AuthenticationState.unAuthenticatedState());
        },
      );
    });
  }
}
