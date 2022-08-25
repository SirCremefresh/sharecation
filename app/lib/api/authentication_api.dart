import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sharecation_app/api/contracts/authentication/v1/authentication.pb.dart';
import 'package:sharecation_app/env.dart';

class AuthenticationApi {
  final Dio _dio = Dio(BaseOptions(
      baseUrl:
          'https://sharecation-authentication-$environment.donato-wolfisberg.workers.dev'));

  Future<CreateAuthenticationWithFirebaseResponse> createJwt({
    required CreateAuthenticationWithFirebaseRequest createJwtRequest,
  }) async {
    const path = r'/v1/create-authentication-with-firebase';
    final options = Options(
        method: r'POST',
        contentType: 'application/json',
        responseType: ResponseType.bytes,
        headers: {'Accept': 'application/octet-stream'});
    var requestBody = createJwtRequest.toProto3Json();
    final response =
        await _dio.request(path, data: requestBody, options: options);

    try {
      return CreateAuthenticationWithFirebaseResponse.fromBuffer(
          response.data!);
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
