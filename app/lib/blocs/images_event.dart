part of 'images_bloc.dart';

@freezed
class ImagesEvent with _$ImagesEvent {
  const factory ImagesEvent.addEvent() = _AddEvent;
  const factory ImagesEvent.uploadEvent() = _UploadEvent;
  const factory ImagesEvent.loadEvent({required String groupId, @Default(false) bool force}) = _LoadEvent;
}

