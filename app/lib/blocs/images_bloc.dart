import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';

part 'images_bloc.freezed.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(const ImagesState.loadingState()) {
    // on<_LoadEvent>((event, emit) async {
    //   emit(const ImagesState.loadingState());
    //   final images = await ImageRepository().listFiles(groupId: event.groupId);
    //   emit(ImagesState.loadedState(images: images, groupId: event.groupId));
    //   if (event.force) {
    //     await ImageRepository()
    //         .downloadImagesFromServer(groupId: event.groupId);
    //     add(ImagesEvent.loadEvent(groupId: event.groupId, force: false));
    //   }
    // });
    // on<_AddEvent>((event, emit) async {
    //   final localState = state;
    //   if (localState is! _LoadedState) {
    //     return;
    //   }
    //
    //   await ImageRepository().saveImage(groupId: localState.groupId);
    //   final images =
    //       await ImageRepository().listFiles(groupId: localState.groupId);
    //   emit(ImagesState.loadedState(images: images, groupId: localState.groupId));
    // });
    // on<_UploadEvent>((event, emit) async {
    //   final localState = state;
    //   if (localState is! _LoadedState) {
    //     return;
    //   }
    //
    //   final localImages = localState.images
    //       .where(
    //           (element) => element.status == SharecationImageStatus.localOnly)
    //       .toList();
    //   for (var image in localImages) {
    //     final uploadedImage = await ImageRepository()
    //         .uploadImage(groupId: localState.groupId, path: image.path);
    //     localState.images.remove(image);
    //     localState.images.add(uploadedImage);
    //     emit(ImagesState.loadedState(
    //         images: localState.images, groupId: localState.groupId));
    //   }
    //   add(ImagesEvent.loadEvent(groupId: localState.groupId));
    // });
  }
}
