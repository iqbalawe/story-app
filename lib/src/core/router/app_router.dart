import 'package:go_router/go_router.dart';
import 'package:story_app/src/core/router/go_router_refresh_stream.dart';
import 'package:story_app/src/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:story_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:story_app/src/features/auth/presentation/screens/register_screen.dart';
import 'package:story_app/src/features/auth/presentation/screens/splash_screen.dart';
import 'package:story_app/src/features/story/presentation/screens/story_list_screen.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;

      final isLoggingIn = state.uri.toString() == '/login';
      final isRegistering = state.uri.toString() == '/register';
      final isSplash = state.uri.toString() == '/splash';

      if (authState is Unauthenticated) {
        if (isRegistering) return null;
        return '/login';
      }

      if (authState is Authenticated) {
        if (isLoggingIn || isSplash || isRegistering) {
          return '/home';
        }
      }

      if (authState is AuthLoginSuccess) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
      GoRoute(path: '/home', builder: (context, state) => StoryListScreen()),
    ],
  );
}
