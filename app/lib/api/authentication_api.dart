import 'dart:async';

import 'package:dio/dio.dart';

import 'model/create_jwt_request.dart';
import 'model/generated_jwt.dart';

class AuthenticationApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://development.sharecation-authentication.donato-wolfisberg.workers.dev'));

  Future<GeneratedJwt> createJwt({
    required CreateJwtRequest createJwtRequest,
  }) async {
    const _path = r'/v1/auth';
    final _options = Options(
      method: r'POST',
      contentType: 'application/json',
    );

    final _response = await _dio.request(_path,
        data: createJwtRequest.toJson(), options: _options);

    try {
      return GeneratedJwt.fromJson(_response.data!);
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
