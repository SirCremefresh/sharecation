import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pb.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';
import 'package:sharecation_app/service/api_service.dart';

part 'groups_event.dart';

part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final ImagesBloc imagesBloc;

  GroupsBloc({required this.imagesBloc}) : super(GroupsLoading()) {
    on<LoadGroupsEvent>((event, emit) async {
      if (event.force) {
        authenticationService.invalidate();
      }
      var groups = await api.groups.getGroups();
      var activeGroup = groups[0];
      emit(GroupsLoaded(groups: groups, activeGroup: activeGroup));
      imagesBloc.add(ImagesEventLoad(groupId: activeGroup.groupId));
    });
    on<GroupsEventAdd>((event, emit) async {
      final group = await api.groups.createGroup(groupName: event.name);
      authenticationService.invalidate();
      final groups = await api.groups.getGroups();
      emit(GroupsLoaded(groups: groups, activeGroup: group));
    });
    on<GroupsEventSelect>((event, emit) async {
      if (state is GroupsLoaded) {
        GroupsLoaded groupsLoaded = state as GroupsLoaded;
        final activeGroup = groupsLoaded.groups
            .firstWhere((element) => element.groupId == event.groupId);

        emit(GroupsLoaded(
            groups: groupsLoaded.groups, activeGroup: activeGroup));
        imagesBloc.add(ImagesEventLoad(groupId: activeGroup.groupId));
      }
    });
  }
}
