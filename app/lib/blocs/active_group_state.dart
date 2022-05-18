part of 'active_group_bloc.dart';

abstract class ActiveGroupState extends Equatable {
  const ActiveGroupState();
}

class ActiveGroupInitial extends ActiveGroupState {
  @override
  List<Object> get props => [];
}

class ActiveGroupSelected extends ActiveGroupState {
  final String groupId;

  const ActiveGroupSelected({required this.groupId});

  @override
  List<Object> get props => [groupId];
}
