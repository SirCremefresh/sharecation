part of 'images_bloc.dart';

@freezed
class ImagesState with _$ImagesState {
  const factory ImagesState.loadingState() = _LoadingState;
  const factory ImagesState.loadedState({required List<SharecationImage> images, required String groupId}) = _LoadedState;
}

