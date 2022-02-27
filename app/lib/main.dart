import 'dart:async';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharecation/pages/camera_page.dart';
import 'package:sharecation/service/api_service.dart';

import 'components/layout.dart';

Future<void> uploadPicture(XFile file) async {
  await api.images.uploadImage(file);
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const providerConfigs = [
      GoogleProviderConfiguration(
        clientId: '1:907454945637:android:05a93d13157dae8bcd698c',
      ),
    ];

    return MaterialApp(
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        '/sign-in': (context) => SignInScreen(
              providerConfigs: providerConfigs,
              actions: [
                AuthStateChangeAction<SignedIn>((context, _) {
                  Navigator.of(context).pushReplacementNamed('/profile');
                }),
              ],
            ),
        '/profile': (context) =>
            Layout(ProfileScreen(providerConfigs: providerConfigs, actions: [
              SignedOutAction((context) {
                Navigator.of(context).pushReplacementNamed('/sign-in');
              }),
            ])),
        '/camera': (context) => const Layout(CameraApp()),
      },
    );
  }
}
