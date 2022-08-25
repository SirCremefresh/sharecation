import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pbserver.dart';
import 'package:sharecation_app/env.dart';
import 'package:sharecation_app/service/jwt_string_getter.dart';

class GroupsApi {
  final JwtStringGetter _jwtStringGetter;

  GroupsApi(this._jwtStringGetter);

  final Dio _dio = Dio(BaseOptions(
      baseUrl:
          'https://sharecation-groups-$environment.donato-wolfisberg.workers.dev'));

  Future<List<Group>> getGroups() async {
    const path = r'/v1/get-groups';
    final options =
        Options(method: r'POST', responseType: ResponseType.bytes, headers: {
      r'Authorization': 'Bearer ${await _jwtStringGetter()}',
      'Accept': 'application/octet-stream'
    });

    var response = await _dio.request(path, options: options);
    try {
      var getImagesByGroupIdResponse =
          GetGroupsResponse.fromBuffer(response.data!);
      return getImagesByGroupIdResponse.ok.groups;
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }
  }

  Future<Group> createGroup({
    required String groupName,
  }) async {
    const path = r'/v1/create-group';
    final options = Options(
        method: r'POST',
        contentType: 'application/json',
        responseType: ResponseType.bytes,
        headers: {
          r'Authorization': 'Bearer ${await _jwtStringGetter()}',
          'Accept': 'application/octet-stream'
        });
    var requestBody = CreateGroupRequest(name: groupName).toProto3Json();
    final response =
        await _dio.request(path, data: requestBody, options: options);

    try {
      var responseBody = CreateGroupResponse.fromBuffer(response.data!);
      return responseBody.ok;
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
