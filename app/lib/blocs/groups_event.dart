part of 'groups_bloc.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();
}

class LoadGroupsEvent extends GroupsEvent {
  @override
  List<Object?> get props => [];
}
