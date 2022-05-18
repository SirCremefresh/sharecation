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

  const GroupsLoaded({required this.groups});

  @override
  List<Object> get props => [];
}
