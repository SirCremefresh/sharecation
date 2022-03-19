import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:sharecation/pages/camera_page.dart';
import 'package:sharecation/service/api_service.dart';

import 'components/layout.dart';

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
                AuthStateChangeAction<SignedIn>((context, state) async {
                  try {
                    var token = await authenticationService.getJwtString();
                    debugPrint(token);
                  } catch (e) {
                    debugPrint("could not log in");
                    return;
                  }
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
