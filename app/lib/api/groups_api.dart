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
    const _path = r'/v1/get-groups';
    final _options =
        Options(method: r'POST', responseType: ResponseType.bytes, headers: {
      r'Authorization': 'Bearer ' + await _jwtStringGetter(),
      'Accept': 'application/octet-stream'
    });

    var _response = await _dio.request(_path, options: _options);
    try {
      var getImagesByGroupIdResponse =
          GetGroupsResponse.fromBuffer(_response.data!);
      return getImagesByGroupIdResponse.ok.groups;
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }
  }

  Future<Group> createGroup({
    required String groupName,
  }) async {
    const _path = r'/v1/create-group';
    final _options = Options(
        method: r'POST',
        contentType: 'application/json',
        responseType: ResponseType.bytes,
        headers: {
          r'Authorization': 'Bearer ' + await _jwtStringGetter(),
          'Accept': 'application/octet-stream'
        });
    var requestBody = CreateGroupRequest(name: groupName).toProto3Json();
    final _response =
        await _dio.request(_path, data: requestBody, options: _options);

    try {
      var responseBody = CreateGroupResponse.fromBuffer(_response.data!);
      return responseBody.ok;
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
