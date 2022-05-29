part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();
}

class ImagesEventAdd extends ImagesEvent {
  final Image image;

  const ImagesEventAdd({required this.image});

  @override
  List<Object> get props => [image];
}

class ImagesEventLoad extends ImagesEvent {
  final String groupId;

  const ImagesEventLoad({required this.groupId});

  @override
  List<Object> get props => [groupId];
}
