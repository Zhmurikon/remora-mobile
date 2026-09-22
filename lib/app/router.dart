import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/auth_provider.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/library/library_screen.dart';
import '../features/study/flashcards_screen.dart';
import '../features/study/learn_screen.dart';
import '../features/study/study_setup_screen.dart';
import '../features/study/write_screen.dart';
import 'home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isAuth = authState.status == AuthStatus.authenticated;
      final isAuthRoute = state.matchedLocation.startsWith('/auth');
      final isUnknown = authState.status == AuthStatus.unknown;

      if (isUnknown) return null;
      if (!isAuth && !isAuthRoute) return '/auth/login';
      if (isAuth && isAuthRoute) return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LibraryScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      // ── Обучение ──
      GoRoute(
        path: '/set/:setId/study',
        builder: (context, state) {
          final setId = state.pathParameters['setId']!;
          final setTitle = state.uri.queryParameters['title'] ?? 'Набор';
          return StudySetupScreen(setId: setId, setTitle: setTitle);
        },
      ),
      GoRoute(
        path: '/set/:setId/study/flashcards',
        builder: (context, state) => const FlashcardsScreen(),
      ),
      GoRoute(
        path: '/set/:setId/study/learn',
        builder: (context, state) => const LearnScreen(),
      ),
      GoRoute(
        path: '/set/:setId/study/write',
        builder: (context, state) => const WriteScreen(),
      ),
    ],
  );
});
