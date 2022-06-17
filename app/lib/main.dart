import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/authentication_bloc.dart';
import 'package:sharecation_app/blocs/main_bloc.dart';
import 'package:sharecation_app/firebase_options.dart';
import 'package:sharecation_app/pages/gallery_screen.dart';
import 'package:sharecation_app/pages/group_info_screen.dart';
import 'package:sharecation_app/pages/loading_screen.dart';
import 'package:sharecation_app/pages/login_screen.dart';
import 'package:sharecation_app/pages/no_groups_screen.dart';
import 'package:sharecation_app/pages/swipe_screen.dart';
import 'package:sharecation_app/pages/synchronise_screen.dart';
import 'package:sharecation_app/repositories/groups_file_accessor_repository.dart';
import 'package:sharecation_app/repositories/task_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: CustomBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GroupsFileAccessorRepository(),
        ),
        RepositoryProvider(
          create: (context) => TaskRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainBloc(
              fileRepository: context.read<GroupsFileAccessorRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(
              mainBloc: context.read<MainBloc>(),
            ),
          ),
        ],
        child: const AuthenticationGuard(),
      ),
    );
  }
}

class AuthenticationGuard extends StatelessWidget {
  const AuthenticationGuard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return state.when(
          initialState: () {
            final user = FirebaseAuth.instance.currentUser;
            final bloc = context.read<AuthenticationBloc>();
            if (user != null) {
              bloc.add(AuthenticationEvent.signedInEvent(userId: user.uid));
            } else {
              bloc.add(const AuthenticationEvent.signedOutEvent());
            }
            return const LoadingScreen();
          },
          signedInState: (userId) => Router(userId: userId),
          unAuthenticatedState: () => const MaterialApp(home: LoginScreen()),
        );
      },
    );
  }
}

class Router extends StatelessWidget {
  final String? userId;

  const Router({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = getGoRouter(context);
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  GoRouter getGoRouter(BuildContext context) {
    return GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/groups',
        routes: [
          GoRoute(
              path: '/groups',
              pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const NoGroupsScreen(),
                  ),
              redirect: (state) {
                return context.read<MainBloc>().state.whenOrNull<String?>(
                  loadedState: (state, userId) {
                    final keys = state.groups.keys;
                    if (keys.isEmpty) return null;
                    return "/groups/${state.groups[keys.first]!.groupId}/info";
                  },
                );
              }),
          GoRoute(
            path: '/synchronise',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const SynchroniseScreen(),
            ),
          ),
          GoRoute(
            path: '/groups/:groupId/info',
            pageBuilder: (context, state) {
              final groupId = state.params["groupId"]!;
              return NoTransitionPage<void>(
                child: GroupInfoScreen(groupId: groupId),
              );
            },
          ),
          GoRoute(
              path: '/groups/:groupId/gallery',
              pageBuilder: (context, state) {
                final groupId = state.params["groupId"]!;
                return NoTransitionPage<void>(
                  child: GalleryScreen(groupId: groupId),
                );
              }),
          GoRoute(
            path: '/groups/:groupId/swipe',
            pageBuilder: (context, state) {
              final groupId = state.params["groupId"]!;
              return NoTransitionPage<void>(
                child: SwipeScreen(groupId: groupId),
              );
            },
          ),
        ],
        );
  }
}

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}
