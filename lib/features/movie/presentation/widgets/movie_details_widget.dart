import '../../../../core/constant/colors.dart';
import '../../../../core/constant/styles.dart';
import 'movie_actors_widget.dart';
import 'review_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/domain/entities/movie_details_entity.dart';
import 'backdrop_image_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetailsEntity movieDetails;
  final bool isFavorite;

  const MovieDetailsWidget({
    Key? key,
    required this.movieDetails,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: orientation == Orientation.landscape
                  ? Helper.screeHeight(context) * 0.65
                  : Helper.screeHeight(context) * 0.475,
              child: BackDropImageWidget(
                movieDetails: movieDetails,
                isFavorite: isFavorite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                top: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Storyline',
                    textAlign: TextAlign.start,
                    style: Styles.textStyle(
                      size: 20,
                      color: Helper.isDark(context)
                          ? AppColors.textColorDark
                          : AppColors.textColorLight,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    movieDetails.overview,
                    style: Styles.textStyle(
                      size: 15.5,
                      weight: FontWeight.w300,
                      color: Helper.isDark(context)
                          ? AppColors.textColorDark
                          : AppColors.textColorLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Visibility(
              visible: movieDetails.credits.isNotEmpty,
              child: SizedBox(
                height: orientation == Orientation.landscape
                    ? Helper.screeHeight(context) * 0.47
                    : Helper.screeHeight(context) * 0.28,
                child: MovieActorsWidget(
                  movieCreditEntity: movieDetails.credits,
                ),
              ),
            ),
            Visibility(
              visible: movieDetails.reviews.isNotEmpty,
              child: SizedBox(
                height: orientation == Orientation.landscape
                    ? Helper.screeHeight(context) * 0.63
                    : Helper.screeHeight(context) * 0.32,
                child: ReviewWidget(movieDetails: movieDetails),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
