import '../../core/utils/helper.dart';
import '../../features/movie/presentation/pages/all_movie_list_page.dart';
import '../../features/movie/presentation/pages/movie_details_page.dart';
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
              name: RouteNames.moviePageName,
              path: RouteNames.moviePagePath,
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const MoviePage(),
                );
              },
              // sub routes
              routes: [
                // all movie display by category page
                GoRoute(
                  name: RouteNames.allMoviePageName,
                  path: RouteNames.allMoviePagePath,
                  builder: (context, state) {
                    final title = state.uri.queryParameters['title'];
                    final type = state.uri.queryParameters['type'] != null
                        ? Helper.getMovieListName(
                            state.uri.queryParameters['type']!)
                        : null;
                    final genreId = state.uri.queryParameters['genreId'] != null
                        ? int.parse(state.uri.queryParameters['genreId']!)
                        : null;
                    return AllMoviePage(
                      title: title!,
                      type: type,
                      genreId: genreId,
                    );
                  },
                ),

                // movie details view page
                GoRoute(
                  name: RouteNames.movieDetailsPageName,
                  path: RouteNames.movieDetailsPagePath,
                  builder: (context, state) {
                    return MovieDetailsPage(
                      movieId: int.parse(state.uri.queryParameters['movieId']!),
                    );
                  },
                ),
              ],
            ),
          ],
        ),

        // favorite branch
        StatefulShellBranch(
          navigatorKey: shellFavoriteNavigatorKey,
          routes: [
            GoRoute(
              name: RouteNames.favoritePageName,
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
