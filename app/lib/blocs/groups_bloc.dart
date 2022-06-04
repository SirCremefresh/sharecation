import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pb.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';
import 'package:sharecation_app/service/api_service.dart';

part 'groups_bloc.freezed.dart';
part 'groups_bloc.g.dart';

part 'groups_event.dart';

part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final ImagesBloc imagesBloc;

  GroupsBloc({required this.imagesBloc})
      : super(const GroupsState.loadingState()) {
    on<_LoadEvent>((event, emit) async {
      if (event.force) {
        authenticationService.invalidate();
      }
      var groups = await api.groups.getGroups();
      var activeGroup = groups[0];
      emit(GroupsState.loadedState(groups: groups, activeGroup: activeGroup));
      imagesBloc.add(ImagesEvent.loadEvent(groupId: activeGroup.groupId));
    });
    on<_AddEvent>((event, emit) async {
      final group = await api.groups.createGroup(groupName: event.name);
      authenticationService.invalidate();
      final groups = await api.groups.getGroups();
      emit(GroupsState.loadedState(groups: groups, activeGroup: group));
    });
    on<_SelectEvent>((event, emit) async {
      if (state is _LoadedState) {
        final groupsLoaded = state as _LoadedState;
        final activeGroup = groupsLoaded.groups
            .firstWhere((element) => element.groupId == event.groupId);

        emit(GroupsState.loadedState(
            groups: groupsLoaded.groups, activeGroup: activeGroup));
        imagesBloc.add(ImagesEvent.loadEvent(groupId: activeGroup.groupId));
      }
    });
  }
}
