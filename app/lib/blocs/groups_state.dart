part of 'groups_bloc.dart';

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState.loadingState() = _LoadingState;

  const factory GroupsState.loadedState(
      {required List<Group> groups, required Group activeGroup}) = _LoadedState;
}

@freezed
class SharecationImage with _$SharecationImage {
  const factory SharecationImage({required String localId}) = _SharecationImage;

  factory SharecationImage.fromJson(Map<String, dynamic> json) =>
      _$SharecationImageFromJson(json);
}

@freezed
class SharecationGroup with _$SharecationGroup {
  const factory SharecationGroup(
      {required Map<String, SharecationImage> images}) = _SharecationGroup;

  factory SharecationGroup.fromJson(Map<String, dynamic> json) =>
      _$SharecationGroupFromJson(json);
}

@freezed
class SharecationGroups with _$SharecationGroups {
  const factory SharecationGroups(
      {required Map<String, SharecationGroup> groups}) = _SharecationGroups;

  factory SharecationGroups.fromJson(Map<String, dynamic> json) =>
      _$SharecationGroupsFromJson(json);
}

void adsf() {
  const sharecationImage = SharecationImage(localId: "localId");
  const group = SharecationGroup(images: {"a": sharecationImage});
  const groups = SharecationGroups(groups: {"b": group});
  var images2 = {...group.images};
  images2.remove("a");
  final copy = group.copyWith(images: images2);
  groups.copyWith(groups: {...groups.groups, "b": copy});
  // var test = FTest(asdf: Map());
  // test.copyWith(asdf: {...test.asdf, "ads": "asdf"});
}
