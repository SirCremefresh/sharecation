import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/blocs/active_group_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';
import 'package:sharecation_app/firebase_options.dart';
import 'package:sharecation_app/pages/groups_screen.dart';
import 'package:sharecation_app/pages/images_screen.dart';
import 'package:sharecation_app/pages/login_screen.dart';
import 'package:sharecation_app/repositories/image_repository.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GroupsBloc()),
        BlocProvider(create: (context) => ImagesBloc()),
        BlocProvider(
            create: (context) => ActiveGroupBloc(
                groupsBloc: context.read<GroupsBloc>(),
                imagesBloc: context.read<ImagesBloc>())),
      ],
      child: MaterialApp(
        initialRoute:
            FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
        routes: {
          '/sign-in': (context) => const LoginScreen(),
          '/profile': (context) => const Layout(ProfileScreen()),
          '/camera': (context) => const Layout(ImagesScreen()),
          '/groups': (context) => const Layout(GroupScreen()),
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveGroupBloc, ActiveGroupState>(
      builder: (context, state) {
        if (state is ActiveGroupSelected) {
          return groupScreen(state);
        }
        return const Text('no group selected');
      },
    );
  }

  Widget groupScreen(ActiveGroupSelected state) {
    return FutureBuilder<List<FileSystemEntity>>(
        future: ImageRepository().listFiles(),
        initialData: const [],
        builder: (context, snapshot) {
          final data = snapshot.data?.join(' ') ?? 'none';
          return Text('selected group: ' + state.groupId + 'images: ' + data);
        });
  }
}
