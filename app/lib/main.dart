import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/authentication_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/firebase_options.dart';
import 'package:sharecation_app/pages/gallery_screen.dart';
import 'package:sharecation_app/pages/group_info_screen.dart';
import 'package:sharecation_app/pages/loading_screen.dart';
import 'package:sharecation_app/pages/login_screen.dart';
import 'package:sharecation_app/pages/select_group_screen.dart';
import 'package:sharecation_app/pages/swipe_screen.dart';
import 'package:sharecation_app/repositories/groups_file_accessor_repository.dart';

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GroupsBloc(
                fileRepository: context.read<GroupsFileAccessorRepository>()),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(
              groupsBloc: context.read<GroupsBloc>(),
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
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return state.maybeWhen(
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
          orElse: () {
            return const Router();
          },
        );
      },
    );
  }
}

class Router extends StatefulWidget {
  const Router({Key? key}) : super(key: key);

  @override
  State<Router> createState() => _RouterState();
}

class _RouterState extends State<Router> {
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
        debugLogDiagnostics: true,
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
        redirect: (state) {
          final authenticationBloc = context.read<AuthenticationBloc>();
          return authenticationBloc.state.whenOrNull<String?>(
            signedInState: (userId) {
              if (state.location == "/sign-in") {
                return "/groups";
              }
              return null;
            },
            unAuthenticatedState: () {
              if (state.location != "/sign-in") {
                return "/sign-in";
              }
              return null;
            },
          );
        });
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
