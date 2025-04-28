import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hockey_family/src/services/app_service.dart';
import 'package:hockey_family/src/ui/pages/firestore_tests/view/firestore_tests_view.dart';
import 'package:hockey_family/src/ui/pages/home/view/home_view.dart';
import 'package:hockey_family/src/ui/pages/match/view/match_view.dart';
import 'package:hockey_family/src/ui/pages/splash/splash_view.dart';
import './routes.dart';
import './scaffold_with_nav_bar.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  GoRouter get router => _goRouter;
  late AppService _appService;

  // Singleton
  static final AppRouter _instance = AppRouter._internal();
  static AppRouter getInstance() => _instance;
  AppRouter._internal() {
    _appService = AppService.getInstance();
  }

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: _appService,
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.home,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: [
            //TODO: Routes in the nav bar around
            GoRoute(
              path: RouteNames.home,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
            GoRoute(
              path: RouteNames.account,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Center(child: Text("Account"),),
              ),
            ),
            GoRoute(
              path: RouteNames.test,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FirestoreTestsPage(),
              ),
            ),
            GoRoute(
              path: RouteNames.match,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MatchPage(),
              ),
            ),
          ]
      ),
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      // Add other pages here
    ],
    redirect: (BuildContext context, GoRouterState state) {
      const homeLocation = RouteNames.home;
      const splashLocation = RouteNames.splash;

      final isInitialized = _appService.initialized;

      final isGoingToInit = state.matchedLocation == splashLocation;

      // If not Initialized and not going to Initialized redirect to Splash
      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
      } else if ((isInitialized && isGoingToInit)) {
        return homeLocation;
      }
      return null;
    },
  );
}