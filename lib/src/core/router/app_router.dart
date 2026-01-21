import 'package:go_router/go_router.dart';
import 'package:story_app/src/core/core.dart';
import 'package:story_app/src/features/auth/presentation/presentation.dart';
import 'package:story_app/src/features/story/presentation/presentation.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final location = state.uri.toString();

      final isLoggingIn = location == '/login';
      final isRegistering = location == '/register';
      final isSplash = location == '/splash';

      final bool isLoggedIn = authState.maybeWhen(
        authenticated: () => true,
        loginSuccess: () => true,
        orElse: () => false,
      );

      final bool isLoggedOut = authState.maybeWhen(
        unauthenticated: () => true,
        initial: () => true,
        orElse: () => false,
      );

      if (isLoggedOut) {
        if (isSplash) {
          return '/login';
        }
        if (isLoggingIn || isRegistering) {
          return null;
        }
        return '/login';
      }

      if (isLoggedIn) {
        if (isSplash || isLoggingIn || isRegistering) {
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
        path: '/pick-location',
        builder: (context, state) => const PickLocationScreen(),
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
