part of 'groups_bloc.dart';

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState.loadingState() = _LoadingState;

  const factory GroupsState.loadedState(
      {required List<Group> groups, required Group activeGroup}) = _LoadedState;
}
