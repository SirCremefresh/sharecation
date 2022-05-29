part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();
}

class ImagesEventAdd extends ImagesEvent {
  @override
  List<Object> get props => [];
}

class ImagesEventLoad extends ImagesEvent {
  final String groupId;

  const ImagesEventLoad({required this.groupId});

  @override
  List<Object> get props => [groupId];
}
