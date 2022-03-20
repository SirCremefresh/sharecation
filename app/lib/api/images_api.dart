import 'dart:async';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sharecation/service/jwt_string_getter.dart';

import 'model/list_images_response.dart';

class ImagesApi {
  final JwtStringGetter _jwtStringGetter;

  ImagesApi(this._jwtStringGetter);

  final Dio _dio = Dio(BaseOptions(
      baseUrl:
          'https://development.sharecation-images.donato-wolfisberg.workers.dev'));

  Future<void> uploadImage(XFile file) async {
    const _path = r'/v1/images/create-image';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        r'Authorization': 'Bearer ' + await _jwtStringGetter(),
      },
    );

    var formData = FormData.fromMap({
      'groupId': 'asdf',
      'file': await MultipartFile.fromFile(file.path, filename: file.name),
    });

    var response = await _dio.request(_path, data: formData, options: _options);

    debugPrint(response.data.toString());
  }

  Future<ListImagesResponse> listImages() async {
    const _path = r'/v1/images';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        r'Authorization': 'Bearer ' + await _jwtStringGetter(),
      },
    );

    final _response = await _dio.request(
      _path,
      options: _options,
    );

    try {
      return ListImagesResponse.fromJson(_response.data!);
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }
  }
}
