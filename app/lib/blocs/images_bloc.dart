import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';
import 'package:sharecation_app/repositories/image_repository.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesLoading()) {
    on<ImagesEventLoad>((event, emit) async {
      emit(ImagesLoading());
      final images = await ImageRepository().listFiles(groupId: event.groupId);
      emit(ImagesLoaded(images: images, groupId: event.groupId));
    });
    on<ImagesEventAdd>((event, emit) async {
      final localState = state;
      if (localState is! ImagesLoaded) {
        return;
      }

      await ImageRepository().saveImage(groupId: localState.groupId);
      final images =
          await ImageRepository().listFiles(groupId: localState.groupId);
      emit(ImagesLoaded(images: images, groupId: localState.groupId));
    });
    on<ImagesEventUpload>((event, emit) async {
      final localState = state;
      if (localState is! ImagesLoaded) {
        return;
      }

      final localImages =
          localState.images.where((element) => element.path != null).toList();
      for (var image in localImages) {
        await ImageRepository()
            .uploadImage(groupId: localState.groupId, path: image.path!);
        final images =
            await ImageRepository().listFiles(groupId: localState.groupId);
        emit(ImagesLoaded(images: images, groupId: localState.groupId));
      }
    });
  }
}
