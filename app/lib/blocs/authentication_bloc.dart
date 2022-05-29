import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GroupsBloc groupsBloc;
  final ImagesBloc imagesBloc;

  AuthenticationBloc({
    required this.groupsBloc,
    required this.imagesBloc,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationEventSignedIn>((event, emit) {
      groupsBloc.add(const LoadGroupsEvent());
    });
  }
}
