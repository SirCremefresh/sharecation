import '../api/images_api.dart';
import 'authentication_service.dart';
import 'jwt_string_getter.dart';

class ApiService {
  final ImagesApi images;

  ApiService(JwtStringGetter jwtStringGetter)
      : images = ImagesApi(jwtStringGetter);
}

AuthenticationService authenticationService = AuthenticationService();
ApiService api = ApiService(authenticationService.getJwtString);
