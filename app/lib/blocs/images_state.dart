part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();
}

class ImagesStateLoading extends ImagesState {
  @override
  List<Object> get props => [];
}

class ImagesStateLoaded extends ImagesState {
  final List<SharecationImage> images;
  final String groupId;

  const ImagesStateLoaded({required this.images, required this.groupId});

  @override
  List<Object> get props => [images, groupId];
}
