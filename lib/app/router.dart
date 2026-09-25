import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/api_client.dart';
import '../features/auth/auth_provider.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/courses/article_screen.dart';
import '../features/courses/course_detail_screen.dart';
import '../features/courses/courses_screen.dart';
import '../features/library/library_screen.dart';
import '../features/study/flashcards_screen.dart';
import '../features/study/learn_screen.dart';
import '../features/study/learn_settings_screen.dart';
import '../features/study/session_result_screen.dart';
import '../features/study/study_setup_screen.dart';
import '../features/study/test_result_screen.dart';
import '../features/study/test_setup_screen.dart';
import '../features/study/test_taking_screen.dart';
import '../features/study/write_screen.dart';
import 'home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      return authRedirect(authState.status, state.matchedLocation);
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const _AuthSplash(),
      ),
      GoRoute(path: '/', builder: (context, state) => const LibraryScreen()),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const HomeScreen(),
      ),
      // ── Курсы (чтение теории) ──
      GoRoute(
        path: '/courses',
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: '/course/:courseId',
        builder: (context, state) {
          final courseId = state.pathParameters['courseId']!;
          final title = state.uri.queryParameters['title'] ?? 'Курс';
          return CourseDetailScreen(courseId: courseId, courseTitle: title);
        },
      ),
      GoRoute(
        path: '/course/:courseId/article/:articleId',
        builder: (context, state) {
          final courseId = state.pathParameters['courseId']!;
          final articleId = state.pathParameters['articleId']!;
          return ArticleScreen(courseId: courseId, articleId: articleId);
        },
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
        path: '/set/:setId/study/settings',
        builder: (context, state) {
          final setId = state.pathParameters['setId']!;
          final setTitle = state.uri.queryParameters['title'] ?? 'Набор';
          return LearnSettingsScreen(setId: setId, setTitle: setTitle);
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
      GoRoute(
        path: '/set/:setId/study/result',
        builder: (context, state) {
          final setId = state.pathParameters['setId']!;
          return SessionResultScreen(setId: setId);
        },
      ),
      // ── Тест ──
      GoRoute(
        path: '/set/:setId/test',
        builder: (context, state) {
          final setId = state.pathParameters['setId']!;
          final setTitle = state.uri.queryParameters['title'] ?? 'Набор';
          return TestSetupScreen(setId: setId, setTitle: setTitle);
        },
      ),
      GoRoute(
        path: '/set/:setId/test/:attemptId',
        builder: (context, state) {
          final setId = state.pathParameters['setId']!;
          final attemptId = state.pathParameters['attemptId']!;
          return TestTakingScreen(setId: setId, attemptId: attemptId);
        },
      ),
      GoRoute(
        path: '/set/:setId/test/:attemptId/result',
        builder: (context, state) {
          final setId = state.pathParameters['setId']!;
          final attemptId = state.pathParameters['attemptId']!;
          final result = state.extra as TestResult?;
          return TestResultScreen(
            setId: setId,
            attemptId: attemptId,
            result: result,
          );
        },
      ),
    ],
  );
});

String? authRedirect(AuthStatus status, String location) {
  final isAuth = status == AuthStatus.authenticated;
  final isAuthRoute = location.startsWith('/auth');
  final isUnknown = status == AuthStatus.unknown;
  final isSplash = location == '/splash';

  // Пока Keystore читается и refresh-токен ротируется, защищённые экраны
  // нельзя строить: их параллельный 401 запустит второй refresh тем же
  // одноразовым токеном и сервер отзовёт всю сессию.
  if (isUnknown) return isSplash ? null : '/splash';
  if (isSplash) return isAuth ? '/' : '/auth/login';
  if (!isAuth && !isAuthRoute) return '/auth/login';
  if (isAuth && isAuthRoute) return '/';
  return null;
}

class _AuthSplash extends StatelessWidget {
  const _AuthSplash();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
