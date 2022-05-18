import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';

part 'active_group_event.dart';

part 'active_group_state.dart';

class ActiveGroupBloc extends Bloc<ActiveGroupEvent, ActiveGroupState> {
  final GroupsBloc groupsBloc;

  ActiveGroupBloc({required this.groupsBloc}) : super(ActiveGroupInitial()) {
    on<SelectGroupEvent>((event, emit) {
      emit(ActiveGroupSelected(groupId: event.groupId));
    });
  }
}
