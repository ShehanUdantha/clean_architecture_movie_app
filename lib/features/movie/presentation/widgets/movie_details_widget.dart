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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Helper.screeHeight(context) * 0.475,
              child: BackDropImageWidget(
                movieDetails: movieDetails,
                isFavorite: isFavorite,
              ),
            ),
            SizedBox(
              height: Helper.screeHeight(context) * 0.22,
              child: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(
                  top: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Storyline',
                      textAlign: TextAlign.start,
                      style: Styles.textStyle(size: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: Helper.screeHeight(context) * 0.15,
                      width: Helper.screeWidth(context),
                      child: Text(
                        movieDetails.overview,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: Styles.textStyle(
                          size: 16,
                          weight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Helper.screeHeight(context) * 0.28,
              child: MovieActorsWidget(
                movieCreditEntity: movieDetails.credits,
              ),
            ),
            SizedBox(
              height: Helper.screeHeight(context) * 0.32,
              child: ReviewWidget(movieDetails: movieDetails),
            ),
          ],
        ),
      ),
    );
  }
}
