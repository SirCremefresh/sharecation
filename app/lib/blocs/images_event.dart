part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();
}

class ImagesEventAdd extends ImagesEvent {
  @override
  List<Object> get props => [];
}

class ImagesEventUpload extends ImagesEvent {
  @override
  List<Object> get props => [];
}

class ImagesEventLoad extends ImagesEvent {
  final String groupId;
  final bool force;

  const ImagesEventLoad({required this.groupId, this.force = false});

  @override
  List<Object> get props => [groupId];
}
