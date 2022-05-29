import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';

part 'active_group_event.dart';

part 'active_group_state.dart';

class ActiveGroupBloc extends Bloc<ActiveGroupEvent, ActiveGroupState> {
  final ImagesBloc imagesBloc;
  final GroupsBloc groupsBloc;

  ActiveGroupBloc({required this.imagesBloc, required this.groupsBloc})
      : super(ActiveGroupInitial()) {
    on<SelectGroupEvent>((event, emit) {
      imagesBloc.add(ImagesEventLoad(groupId: event.groupId));
      emit(ActiveGroupSelected(groupId: event.groupId));
    });
  }
}
