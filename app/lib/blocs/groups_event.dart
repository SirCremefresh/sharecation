part of 'groups_bloc.dart';

@freezed
class GroupsEvent with _$GroupsEvent {
  const factory GroupsEvent.loadGroupsForUser({required String userId}) =
      _LoadGroupsForUser;

  const factory GroupsEvent.initialLoad({required SharecationGroups groups}) =
      _InitialLoadEvent;

  const factory GroupsEvent.groupsLoaded({required List<SharecationEmptyGroup> groups}) =
      _GroupsLoadedEvent;

  const factory GroupsEvent.imageUpdated({required String groupId, required SharecationImage image}) =
      _ImageUpdatedEvent;

  const factory GroupsEvent.selectEvent({required String groupId}) =
      _SelectEvent;

  const factory GroupsEvent.addEvent({required String name}) = _AddEvent;
}
