part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();
}

class AddImageEvent extends ImagesEvent {
  final Image image;

  const AddImageEvent({required this.image});

  @override
  List<Object> get props => [image];
}

class GroupIdChangedEvent extends ImagesEvent {
  final String groupId;

  const GroupIdChangedEvent({required this.groupId});

  @override
  List<Object> get props => [groupId];
}
