import 'package:go_router/go_router.dart';
import 'package:story_app/src/core/router/go_router_refresh_stream.dart';
import 'package:story_app/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:story_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:story_app/src/features/auth/presentation/screens/register_screen.dart';
import 'package:story_app/src/features/auth/presentation/screens/splash_screen.dart';
import 'package:story_app/src/features/story/presentation/screens/add_story_screen.dart';
import 'package:story_app/src/features/story/presentation/screens/story_detail_screen.dart';
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
        if (isSplash) {
          return '/login';
        }

        if (isLoggingIn || isRegistering) {
          return null;
        }

        return '/login';
      }

      if (authState is Authenticated || authState is AuthLoginSuccess) {
        if (isLoggingIn || isSplash || isRegistering) {
          return '/home';
        }
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/add-story',
        name: 'add_story',
        builder: (context, state) => const AddStoryScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const StoryListScreen(),
        routes: [
          GoRoute(
            path: 'stories/:id',
            name: 'story_detail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return StoryDetailScreen(storyId: id);
            },
          ),
        ],
      ),
    ],
  );
}
