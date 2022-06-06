import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';

part 'authentication_bloc.freezed.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GroupsBloc groupsBloc;

  AuthenticationBloc({
    required this.groupsBloc,
  }) : super(const AuthenticationState.initialState()) {
    on<AuthenticationEvent>((event, emit) {
      event.when(
        signedInEvent: (userId) {
          emit(AuthenticationState.signedInState(userId: userId));
          groupsBloc.add(GroupsEvent.loadGroupsForUser(userId: userId));
        },
        signedOutEvent: () {
          emit(const AuthenticationState.unAuthenticatedState());
        },
      );
    });
  }
}
