part of 'groups_bloc.dart';

@freezed
class GroupsEvent with _$GroupsEvent {
  const factory GroupsEvent.loadGroupsForUser({
    required String userId,
    @Default(true) bool loadFromFile,
    @Default(false) bool loadFromServer,
  }) = _LoadGroupsForUser;

  const factory GroupsEvent.loadGroups({
    @Default(true) bool loadFromFile,
    @Default(false) bool loadFromServer,
  }) = _LoadGroups;

  const factory GroupsEvent.loadImages() = _LoadImages;

  const factory GroupsEvent.addImage({required String groupId}) = _AddImageEvent;

  const factory GroupsEvent.initialLoad({required SharecationGroups groups}) =
      _InitialLoadEvent;

  const factory GroupsEvent.patchImages({required String groupId, required List<SharecationImage> images}) =
      _PatchImagesEvent;

  const factory GroupsEvent.groupsLoaded(
      {required List<SharecationEmptyGroup> groups}) = _GroupsLoadedEvent;

  const factory GroupsEvent.imageUpdated(
      {required String groupId,
      required SharecationImage image}) = _ImageUpdatedEvent;

  const factory GroupsEvent.selectEvent({required String groupId}) =
      _SelectEvent;

  const factory GroupsEvent.addEvent({required String name}) = _AddEvent;
}
