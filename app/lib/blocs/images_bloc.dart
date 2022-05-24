import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesLoading()) {
    on<GroupIdChangedEvent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
