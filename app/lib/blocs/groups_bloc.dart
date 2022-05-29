import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pb.dart';
import 'package:sharecation_app/service/api_service.dart';

part 'groups_event.dart';

part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc() : super(GroupsLoading()) {
    on<LoadGroupsEvent>((event, emit) async {
      if (event.force) {
        authenticationService.invalidate();
      }
      var groups = await api.groups.getGroups();
      emit(GroupsLoaded(groups: groups, activeGroup: groups[0]));
    });
    on<GroupsEventAdd>((event, emit) async {
      final group = await api.groups.createGroup(groupName: event.name);
      authenticationService.invalidate();
      final groups = await api.groups.getGroups();
      emit(GroupsLoaded(groups: groups, activeGroup: group));
    });
  }
}
