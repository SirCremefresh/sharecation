import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';
import 'package:sharecation_app/repositories/image_repository.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesLoading()) {
    on<ImagesEventLoad>((event, emit) async {
      emit(ImagesLoading());
      final images = await ImageRepository().listFiles(groupId: event.groupId);
      emit(ImagesLoaded(images: images));
    });
  }
}
