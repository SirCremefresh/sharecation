import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';

part 'active_group_event.dart';

part 'active_group_state.dart';

class ActiveGroupBloc extends Bloc<ActiveGroupEvent, ActiveGroupState> {
  final GroupsBloc groupsBloc;
  final ImagesBloc imagesBloc;

  ActiveGroupBloc({required this.groupsBloc, required this.imagesBloc})
      : super(ActiveGroupInitial()) {
    on<SelectGroupEvent>((event, emit) {
      imagesBloc.add(GroupIdChangedEvent(groupId: event.groupId));
      emit(ActiveGroupSelected(groupId: event.groupId));
    });
  }
}
