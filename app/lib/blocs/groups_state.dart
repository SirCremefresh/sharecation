part of 'groups_bloc.dart';

abstract class GroupsState extends Equatable {
  const GroupsState();
}

class GroupsLoading extends GroupsState {
  @override
  List<Object> get props => [];
}

class GroupsLoaded extends GroupsState {
  final List<Group> groups;
  final Group activeGroup;

  const GroupsLoaded({required this.groups, required this.activeGroup});

  @override
  List<Object> get props => [groups, activeGroup];
}
