import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharecation/api/authentication_api.dart';
import 'package:sharecation/api/contracts/authentication/v1/authentication.pb.dart';

class _CurrentAuthentication {
  final String jwtString;
  final DateTime expiresAt;

  _CurrentAuthentication(Authenticated authenticated)
      : jwtString = authenticated.jwtString,
        expiresAt =
            DateTime.fromMillisecondsSinceEpoch(authenticated.data.exp * 1000);
}

class AuthenticationService {
  final AuthenticationApi _api = AuthenticationApi();
  _CurrentAuthentication? _current;

  Future<String> getJwtString() async {
    return (await getCurrent()).jwtString;
  }

  Future<_CurrentAuthentication> getCurrent() async {
    if (_isCurrentValid()) {
      return _current!;
    }
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User is not logged in');
    }
    var firebaseJwtString = await user.getIdToken();

    var generatedJwt = await _api.createJwt(
        createJwtRequest: CreateAuthenticationWithFirebaseRequest(
            firebaseJwtString: firebaseJwtString));

    var current = _CurrentAuthentication(generatedJwt.ok);
    _current = current;
    return current;
  }

  bool _isCurrentValid() {
    if (_current == null) {
      return false;
    }
    return _current!.expiresAt.isAfter(DateTime.now());
  }
}
