import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';
import 'package:sharecation_app/repositories/image_repository.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesStateLoading()) {
    on<ImagesEventLoad>((event, emit) async {
      emit(ImagesStateLoading());
      final images = await ImageRepository().listFiles(groupId: event.groupId);
      emit(ImagesStateLoaded(images: images, groupId: event.groupId));
      if (event.force) {}
    });
    on<ImagesEventAdd>((event, emit) async {
      final localState = state;
      if (localState is! ImagesStateLoaded) {
        return;
      }

      await ImageRepository().saveImage(groupId: localState.groupId);
      final images =
          await ImageRepository().listFiles(groupId: localState.groupId);
      emit(ImagesStateLoaded(images: images, groupId: localState.groupId));
    });
    on<ImagesEventUpload>((event, emit) async {
      final localState = state;
      if (localState is! ImagesStateLoaded) {
        return;
      }

      final localImages = localState.images
          .where(
              (element) => element.status == SharecationImageStatus.localOnly)
          .toList();
      for (var image in localImages) {
        final uploadedImage = await ImageRepository()
            .uploadImage(groupId: localState.groupId, path: image.path);
        localState.images.remove(image);
        localState.images.add(uploadedImage);
        emit(ImagesStateLoaded(
            images: localState.images, groupId: localState.groupId));
      }
      add(ImagesEventLoad(groupId: localState.groupId));
    });
  }
}
