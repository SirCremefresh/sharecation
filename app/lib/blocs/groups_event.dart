part of 'groups_bloc.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();
}

class GroupsEventLoad extends GroupsEvent {
  final bool force;

  const GroupsEventLoad({this.force = false});

  @override
  List<Object?> get props => [force];
}

class GroupsEventAdd extends GroupsEvent {
  final String name;

  const GroupsEventAdd({required this.name});

  @override
  List<Object?> get props => [name];
}

class GroupsEventSelect extends GroupsEvent {
  final String groupId;

  const GroupsEventSelect({required this.groupId});

  @override
  List<Object?> get props => [groupId];
}
