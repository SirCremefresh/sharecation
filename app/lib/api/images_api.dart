import 'dart:async';

import 'package:camera/camera.dart' as $camera;
import 'package:dio/dio.dart';
import 'package:sharecation_app/api/contracts/images/v1/images.pb.dart';
import 'package:sharecation_app/service/jwt_string_getter.dart';

class ImagesApi {
  final JwtStringGetter _jwtStringGetter;

  ImagesApi(this._jwtStringGetter);

  final Dio _dio = Dio(BaseOptions(
      baseUrl:
          'https://development.sharecation-images.donato-wolfisberg.workers.dev'));

  Future<void> uploadImage($camera.XFile file) async {
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
  }

  Future<List<Image>> listImages() async {
    const _path = r'/v1/images';
    final _options =
        Options(method: r'POST', responseType: ResponseType.bytes, headers: {
      r'Authorization': 'Bearer ' + await _jwtStringGetter(),
      'Accept': 'application/octet-stream'
    });

    final _response = await _dio.request(
      _path,
      options: _options,
    );

    try {
      var getImagesByGroupIdResponse =
          GetImagesByGroupIdResponse.fromBuffer(_response.data!);
      return getImagesByGroupIdResponse.ok.images;
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
