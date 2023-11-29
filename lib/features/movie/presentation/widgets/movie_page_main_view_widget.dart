import '../../../../core/constant/colors.dart';

import '../../../../core/constant/styles.dart';
import 'genres_widget.dart';
import 'popular_movies_widget.dart';
import 'trending_movies_widget.dart';
import 'upcoming_movies_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enum.dart';
import '../../../../core/utils/helper.dart';
import '../pages/all_movie_list_page.dart';

class MoviePageMainViewWidget extends StatelessWidget {
  const MoviePageMainViewWidget({
    super.key,
  });

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
              style: Styles.textStyle(size: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AllMoviePage(
                      title: 'Trending',
                      type: MoviesList.trending,
                    ),
                  ),
                );
              },
              child: Text(
                'See all',
                style: Styles.textStyle(
                  size: 14,
                  color: AppColors.purpleColor,
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
              style: Styles.textStyle(size: 16),
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
              style: Styles.textStyle(size: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AllMoviePage(
                      title: 'Popular',
                      type: MoviesList.popular,
                    ),
                  ),
                );
              },
              child: Text(
                'See all',
                style: Styles.textStyle(
                  size: 14,
                  color: AppColors.purpleColor,
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
