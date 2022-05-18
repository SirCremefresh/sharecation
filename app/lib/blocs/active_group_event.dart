part of 'active_group_bloc.dart';

abstract class ActiveGroupEvent extends Equatable {
  const ActiveGroupEvent();
}

class SelectGroupEvent extends ActiveGroupEvent {
  final String groupId;

  const SelectGroupEvent({required this.groupId});

  @override
  List<Object?> get props => [groupId];
}
