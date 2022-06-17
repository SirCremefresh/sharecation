part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.loadGroupsForUser({
    required String userId,
    @Default(true) bool loadFromFile,
    @Default(false) bool loadFromServer,
  }) = _LoadGroupsForUser;

  const factory MainEvent.loadGroups({
    @Default(true) bool loadFromFile,
    @Default(false) bool loadFromServer,
  }) = _LoadGroups;

  const factory MainEvent.loadImages() = _LoadImages;

  const factory MainEvent.addImage({required String groupId}) = _AddImageEvent;

  const factory MainEvent.initialLoad({required SharecationGroups groups}) =
      _InitialLoadEvent;

  const factory MainEvent.patchImages({required String groupId, required List<SharecationImage> images}) =
      _PatchImagesEvent;

  const factory MainEvent.groupsLoaded(
      {required List<SharecationEmptyGroup> groups}) = _GroupsLoadedEvent;

  const factory MainEvent.imageUpdated(
      {required String groupId,
      required SharecationImage image}) = _ImageUpdatedEvent;

  const factory MainEvent.addEvent({required String name}) = _AddEvent;
}
