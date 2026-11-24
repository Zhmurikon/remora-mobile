import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/api_client.dart';
import '../features/auth/auth_provider.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/catalog/catalog_screen.dart';
import '../features/courses/article_screen.dart';
import '../features/courses/course_detail_screen.dart';
import '../features/courses/courses_screen.dart';
import '../features/dashboard/dashboard_screen.dart';
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
import '../features/study/battle_screen.dart';
import '../features/workspace/assistant_screen.dart';
import '../features/workspace/billing_screen.dart';
import '../features/workspace/classes_screen.dart';
import '../features/workspace/collection_screens.dart';
import '../features/workspace/workspace.dart';
import 'app_shell.dart';
import 'home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final status = ValueNotifier(ref.read(authProvider).status);
  ref.listen(
    authProvider.select((state) => state.status),
    (_, next) => status.value = next,
  );
  final router = GoRouter(
    refreshListenable: status,
    initialLocation: '/',
    redirect: (context, state) {
      return authRedirect(status.value, state.uri.toString());
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const _AuthSplash(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/courses',
                builder: (context, state) => const CoursesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/sets',
                builder: (context, state) => const LibraryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/catalog',
                builder: (context, state) => const CatalogScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(path: '/workspace', builder: (_, _) => const WorkspaceMenu()),
      GoRoute(path: '/assistant', builder: (_, _) => const AssistantScreen()),
      GoRoute(
        path: '/achievements',
        builder: (_, _) => const AchievementsScreen(),
      ),
      GoRoute(path: '/app/billing', redirect: (_, _) => '/billing'),
      GoRoute(
        path: '/app/classes/join',
        builder: (_, state) =>
            ClassesScreen(inviteCode: state.uri.queryParameters['code']),
      ),
      GoRoute(path: '/billing', builder: (_, _) => const BillingScreen()),
      GoRoute(path: '/classes', builder: (_, _) => const ClassesScreen()),
      GoRoute(
        path: '/classes/:id',
        builder: (_, state) => ClassScreen(state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/saved-articles',
        builder: (_, _) => const SavedArticlesScreen(),
      ),
      GoRoute(
        path: '/saved-articles/:id',
        builder: (_, state) => SavedArticleScreen(state.pathParameters['id']!),
      ),
      // ── Курсы (чтение теории) ──
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
        path: '/course/:courseId/study',
        builder: (_, state) => StudySetupScreen.course(
          courseId: state.pathParameters['courseId']!,
          title: state.uri.queryParameters['title'] ?? 'Весь курс',
        ),
      ),
      GoRoute(
        path: '/course/:courseId/study/flashcards',
        builder: (_, _) => const FlashcardsScreen(),
      ),
      GoRoute(
        path: '/course/:courseId/study/learn',
        builder: (_, _) => const LearnScreen(),
      ),
      GoRoute(
        path: '/course/:courseId/study/write',
        builder: (_, _) => const WriteScreen(),
      ),
      GoRoute(
        path: '/course/:courseId/study/result',
        builder: (_, state) => SessionResultScreen.course(
          courseId: state.pathParameters['courseId']!,
        ),
      ),
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
        path: '/set/:setId/battle',
        builder: (context, state) => BattleSetupScreen(
          setId: state.pathParameters['setId']!,
          setTitle: state.uri.queryParameters['title'] ?? 'Набор',
        ),
      ),
      GoRoute(
        path: '/battle/:battleId',
        builder: (context, state) => BattleScreen(
          battleId: state.pathParameters['battleId']!,
          inviteToken: state.uri.queryParameters['invite'],
        ),
      ),
      GoRoute(
        path: '/app/battles/:battleId',
        builder: (context, state) => BattleScreen(
          battleId: state.pathParameters['battleId']!,
          inviteToken: state.uri.queryParameters['invite'],
        ),
      ),
      GoRoute(
        path: '/set/:setId/quiz',
        builder: (context, state) {
          final setId = state.pathParameters['setId']!;
          final setTitle = state.uri.queryParameters['title'] ?? 'Набор';
          return TestSetupScreen(
            setId: setId,
            setTitle: setTitle,
            customQuiz: true,
          );
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
  ref.onDispose(() {
    router.dispose();
    status.dispose();
  });
  return router;
});

String? authRedirect(AuthStatus status, String location) {
  final isAuth = status == AuthStatus.authenticated;
  final isAuthRoute = location.startsWith('/auth');
  final isUnknown = status == AuthStatus.unknown;
  final uri = Uri.parse(location);
  final isSplash = uri.path == '/splash';
  final target = uri.queryParameters['next'];
  final next =
      target != null &&
          target.startsWith('/') &&
          !target.startsWith('//') &&
          !target.startsWith('/auth') &&
          !target.startsWith('/splash')
      ? target
      : '/';

  // Пока Keystore читается и refresh-токен ротируется, защищённые экраны
  // нельзя строить: их параллельный 401 запустит второй refresh тем же
  // одноразовым токеном и сервер отзовёт всю сессию.
  if (isUnknown) {
    if (isSplash) return null;
    return location == '/'
        ? '/splash'
        : '/splash?next=${Uri.encodeComponent(location)}';
  }
  if (isSplash) {
    if (isAuth) return next;
    return next == '/'
        ? '/auth/login'
        : '/auth/login?next=${Uri.encodeComponent(next)}';
  }
  if (!isAuth && !isAuthRoute) {
    return '/auth/login?next=${Uri.encodeComponent(location)}';
  }
  if (isAuth && isAuthRoute) {
    return next;
  }
  return null;
}

class _AuthSplash extends StatelessWidget {
  const _AuthSplash();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
