part of 'groups_bloc.dart';

abstract class GroupsState extends Equatable {
  const GroupsState();
}

class GroupsStateLoading extends GroupsState {
  @override
  List<Object> get props => [];
}

class GroupsStateLoaded extends GroupsState {
  final List<Group> groups;
  final Group activeGroup;

  const GroupsStateLoaded({required this.groups, required this.activeGroup});

  @override
  List<Object> get props => [groups, activeGroup];
}
