import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharecation_app/blocs/authentication_bloc.dart';

import '../service/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // FirebaseAuth.instance.userChanges().first.then((user) {
    //   if (user == null) {
    //     return;
    //   }
    //   context
    //       .read<AuthenticationBloc>()
    //       .add(AuthenticationEvent.signedInEvent(userId: user.uid));
    //   context.go('/groups');
    // });
  }

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
              var authenticationBloc = context.read<AuthenticationBloc>();
              authenticationBloc.add(
                AuthenticationEvent.signedInEvent(
                  userId: credentials.user!.uid,
                ),
              );
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
