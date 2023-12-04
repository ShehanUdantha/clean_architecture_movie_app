import '../../../../core/constant/route_names.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/colors.dart';

import '../../../../core/constant/styles.dart';
import 'genres_widget.dart';
import 'popular_movies_widget.dart';
import 'trending_movies_widget.dart';
import 'upcoming_movies_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enum.dart';
import '../../../../core/utils/helper.dart';

class MoviePageMainViewWidget extends StatelessWidget {
  const MoviePageMainViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Helper.screeHeight(context) * 0.3,
          child: const UpComingMoviesWidget(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Trending Movies',
              style: Styles.textStyle(
                size: 16,
                color: Helper.isDark(context)
                    ? AppColors.textColorDark
                    : AppColors.textColorLight,
              ),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(
                  RouteNames.allMoviePageName,
                  queryParameters: {
                    'title': 'Trending',
                    'type': 'trending',
                  },
                );
              },
              child: Text(
                'See all',
                style: Styles.textStyle(
                  size: 14,
                  color: Helper.isDark(context)
                      ? AppColors.purpleColorDark
                      : AppColors.purpleColorLight,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Helper.screeHeight(context) * 0.28,
          child: const TrendingMoviesWidget(
            type: CardTypes.vertical,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Genres',
              style: Styles.textStyle(
                size: 16,
                color: Helper.isDark(context)
                    ? AppColors.textColorDark
                    : AppColors.textColorLight,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: Helper.screeHeight(context) * 0.2,
          child: const GenresWidget(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Movies',
              style: Styles.textStyle(
                size: 16,
                color: Helper.isDark(context)
                    ? AppColors.textColorDark
                    : AppColors.textColorLight,
              ),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(
                  RouteNames.allMoviePageName,
                  queryParameters: {
                    'title': 'Popular',
                    'type': 'popular',
                  },
                );
              },
              child: Text(
                'See all',
                style: Styles.textStyle(
                  size: 14,
                  color: Helper.isDark(context)
                      ? AppColors.purpleColorDark
                      : AppColors.purpleColorLight,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Helper.screeHeight(context) * 0.28,
          child: const PopularMoviesWidget(
            type: CardTypes.vertical,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
