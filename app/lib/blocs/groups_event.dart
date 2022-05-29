part of 'groups_bloc.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();
}

class LoadGroupsEvent extends GroupsEvent {
  final bool force;

  const LoadGroupsEvent({this.force = false});

  @override
  List<Object?> get props => [force];
}

class GroupsEventAdd extends GroupsEvent {
  final String name;

  const GroupsEventAdd({required this.name});

  @override
  List<Object?> get props => [name];
}
