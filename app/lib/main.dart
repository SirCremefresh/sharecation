import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/authentication_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';
import 'package:sharecation_app/firebase_options.dart';
import 'package:sharecation_app/pages/gallery_screen.dart';
import 'package:sharecation_app/pages/group_info_screen.dart';
import 'package:sharecation_app/pages/login_screen.dart';
import 'package:sharecation_app/pages/select_group_screen.dart';
import 'package:sharecation_app/pages/swipe_screen.dart';

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
        BlocProvider(
          create: (context) => ImagesBloc(),
        ),
        BlocProvider(
          create: (context) => GroupsBloc(
            imagesBloc: context.read<ImagesBloc>(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            imagesBloc: context.read<ImagesBloc>(),
            groupsBloc: context.read<GroupsBloc>(),
          ),
        ),
      ],
      child: const Router(),
    );
  }
}

class Router extends StatelessWidget {
  const Router({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = getGoRouter(context);
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  GoRouter getGoRouter(BuildContext context) {
    return GoRouter(
        initialLocation: '/sign-in',
        routes: [
          GoRoute(
            path: '/sign-in',
            builder: (context, state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: '/groups',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const SelectGroupScreen(),
            ),
          ),
          GoRoute(
            path: '/groups/:groupId/info',
            pageBuilder: (context, state) {
              final groupId = state.params["groupId"]!;
              context
                  .read<GroupsBloc>()
                  .add(GroupsEventSelect(groupId: groupId));
              return NoTransitionPage<void>(
                child: GroupInfoScreen(groupId: groupId),
              );
            },
          ),
          GoRoute(
              path: '/groups/:groupId/gallery',
              pageBuilder: (context, state) {
                final groupId = state.params["groupId"]!;
                context
                    .read<GroupsBloc>()
                    .add(GroupsEventSelect(groupId: groupId));
                return NoTransitionPage<void>(
                  child: GalleryScreen(groupId: groupId),
                );
              }),
          GoRoute(
            path: '/groups/:groupId/swipe',
            pageBuilder: (context, state) {
              final groupId = state.params["groupId"]!;
              context
                  .read<GroupsBloc>()
                  .add(GroupsEventSelect(groupId: groupId));
              return NoTransitionPage<void>(
                child: SwipeScreen(groupId: groupId),
              );
            },
          ),
        ],
        redirect: (state) {
          if (FirebaseAuth.instance.currentUser == null &&
              state.location != "/sign-in") {
            return "/sign-in";
          }
          if (FirebaseAuth.instance.currentUser != null &&
              state.location == "/sign-in") {
            context
                .read<AuthenticationBloc>()
                .add(const AuthenticationEventSignedIn());
            return "/groups";
          }
          return null;
        });
  }
}
