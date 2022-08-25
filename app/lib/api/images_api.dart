import 'dart:async';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecation_app/api/contracts/images/v1/images.pb.dart';
import 'package:sharecation_app/env.dart';
import 'package:sharecation_app/service/jwt_string_getter.dart';

class ImagesApi {
  final JwtStringGetter _jwtStringGetter;

  ImagesApi(this._jwtStringGetter);

  final Dio _dio = Dio(BaseOptions(
      baseUrl:
          'https://sharecation-images-$environment.donato-wolfisberg.workers.dev'));

  Future<Image> uploadImage(String groupId, XFile file) async {
    const path = r'/v1/create-image';
    final options = Options(
        method: r'POST',
        contentType: 'application/json',
        responseType: ResponseType.bytes,
        headers: {
          r'Authorization': 'Bearer ${await _jwtStringGetter()}',
          'Accept': 'application/octet-stream'
        });

    var formData = FormData.fromMap({
      'groupId': groupId,
      'file': await MultipartFile.fromFile(file.path, filename: file.name),
    });

    var response =
        await _dio.request(path, data: formData, options: options);
    try {
      var getImagesByGroupIdResponse =
          CreateImageResponse.fromBuffer(response.data!);
      return getImagesByGroupIdResponse.ok;
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }
  }

  Future<void> downloadImage(String url, String path) async {
    await _dio.download(url, path);
  }

  Future<List<Image>> getImagesByGroupId(String groupId) async {
    const path = r'/v1/get-images-by-group-id';
    final options = Options(
        method: r'POST',
        contentType: 'application/json',
        responseType: ResponseType.bytes,
        headers: {
          r'Authorization': 'Bearer ${await _jwtStringGetter()}',
          'Accept': 'application/octet-stream'
        });
    var requestBody =
        GetImagesByGroupIdRequest(groupId: groupId).toProto3Json();

    final response = await _dio.request(
      path,
      data: requestBody,
      options: options,
    );

    try {
      var getImagesByGroupIdResponse =
          GetImagesByGroupIdResponse.fromBuffer(response.data!);
      return getImagesByGroupIdResponse.ok.images;
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }
  }
}
