part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();
}

class ImagesLoading extends ImagesState {
  @override
  List<Object> get props => [];
}

class ImagesLoaded extends ImagesState {
  final List<SharecationImage> images;
  final String groupId;

  const ImagesLoaded({required this.images, required this.groupId});

  @override
  List<Object> get props => [images, groupId];
}
