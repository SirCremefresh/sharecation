import 'package:sharecation_app/api/groups_api.dart';

import '../api/images_api.dart';
import 'authentication_service.dart';
import 'jwt_string_getter.dart';

class ApiService {
  final ImagesApi images;
  final GroupsApi groups;

  ApiService(JwtStringGetter jwtStringGetter)
      : images = ImagesApi(jwtStringGetter),
        groups = GroupsApi(jwtStringGetter);
}

AuthenticationService authenticationService = AuthenticationService();
ApiService api = ApiService(authenticationService.getJwtString);
