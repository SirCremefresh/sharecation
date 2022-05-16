import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/firebase_options.dart';
import 'package:sharecation_app/pages/camera_screen.dart';
import 'package:sharecation_app/pages/groups_screen.dart';
import 'package:sharecation_app/service/api_service.dart';

import 'components/layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const providerConfigs = [
      GoogleProviderConfiguration(
        clientId:
            '907454945637-be09k2vnpd6qcniu9rto8nrdghi9uhg5.apps.googleusercontent.com',
      ),
    ];

    return BlocProvider(
      create: (context) => GroupsBloc(),
      child: MaterialApp(
        initialRoute:
            FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
        routes: {
          '/sign-in': (context) => SignInScreen(
                providerConfigs: providerConfigs,
                showAuthActionSwitch: false,
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state) async {
                    try {
                      await authenticationService.getJwtString();
                      context.read<GroupsBloc>().add(LoadGroupsEvent());
                      Navigator.of(context).pushReplacementNamed('/profile');
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
                  }),
                ],
              ),
          '/profile': (context) =>
              Layout(ProfileScreen(providerConfigs: providerConfigs, actions: [
                SignedOutAction((context) {
                  Navigator.of(context).pushReplacementNamed('/sign-in');
                }),
              ])),
          '/camera': (context) => const Layout(CameraScreen()),
          '/groups': (context) => const Layout(GroupScreen()),
        },
      ),
    );
  }
}
