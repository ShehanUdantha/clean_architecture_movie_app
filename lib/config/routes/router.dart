import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/route_names.dart';
import '../../core/presentation/pages/home_page.dart';
import '../../features/favorite/presentation/pages/favorite_page.dart';
import '../../features/movie/presentation/pages/movie_page.dart';

// private navigators
final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellMovieNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellMovie');
final shellFavoriteNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellFavorite');

GoRouter router = GoRouter(
  initialLocation: RouteNames.moviePagePath,
  navigatorKey: rootNavigatorKey,
  routes: [
    // home page
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(
          statefulNavigationShell: navigationShell,
        );
      },
      branches: [
        // movie branch
        StatefulShellBranch(
          navigatorKey: shellMovieNavigatorKey,
          routes: [
            GoRoute(
              path: RouteNames.moviePagePath,
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const MoviePage(),
                );
              },
            ),
          ],
        ),

        // favorite branch
        StatefulShellBranch(
          navigatorKey: shellFavoriteNavigatorKey,
          routes: [
            GoRoute(
              path: RouteNames.favoritePagePath,
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const FavoritePage(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
