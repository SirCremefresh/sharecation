import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sharecation/api/contracts/authentication/v1/authentication.pb.dart';

class AuthenticationApi {
  final Dio _dio = Dio(BaseOptions(
      baseUrl:
          'https://development.sharecation-authentication.donato-wolfisberg.workers.dev'));

  Future<CreateAuthenticationWithFirebaseResponse> createJwt({
    required CreateAuthenticationWithFirebaseRequest createJwtRequest,
  }) async {
    const _path = r'/v1/create-authentication-with-firebase';
    final _options = Options(
        method: r'POST',
        contentType: 'application/json',
        responseType: ResponseType.bytes,
        headers: {'Accept': 'application/octet-stream'});
    var requestBody = createJwtRequest.toProto3Json();
    final _response =
        await _dio.request(_path, data: requestBody, options: _options);

    try {
      return CreateAuthenticationWithFirebaseResponse.fromBuffer(
          _response.data!);
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
