import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharecation_app/blocs/authentication_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';

import '../service/api_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        child: Row(children: const [
          Icon(Icons.fire_truck),
          SizedBox(
            width: 8,
          ),
          Text('Sign in with google')
        ]),
        onPressed: () async {
          final credentials = await signInWithGoogle();
          if (credentials != null) {
            try {
              await authenticationService.getJwtString();
              context
                  .read<AuthenticationBloc>()
                  .add(const AuthenticationEventSignedIn());
              context.go('/groups');
            } catch (e) {
              Fluttertoast.showToast(
                  msg: "Error during Sign in",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              await FirebaseAuth.instance.signOut();
              return;
            }
          }
        },
      ),
    ));
  }
}

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if (googleUser == null) {
    return null;
  }
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
