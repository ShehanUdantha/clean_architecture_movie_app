import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/domain/entities/movie_details_entity.dart';

class BackDropImageWidget extends StatelessWidget {
  final MovieDetailsEntity movieDetails;
  final bool isFavorite;

  const BackDropImageWidget({
    Key? key,
    required this.movieDetails,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: movieDetails.backdropPath != ''
                  ? Helper.generateImageUrl(movieDetails.backdropPath)
                  : APIConstant.defaultMovieImage,
              imageBuilder: (context, imageProvider) => Container(
                height: Helper.screeHeight(context) * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: Helper.screeHeight(context) * 0.452,
              decoration: Styles.linearBoxDecoration(radius: 0),
            ),
            Positioned(
              bottom: 33,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(10.0).copyWith(
                  right: 0,
                ),
                width: Helper.screeWidth(context) * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieDetails.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Styles.textStyle(size: 23),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      height: 18,
                      width: Helper.screeWidth(context) * 0.7,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: movieDetails.genres.length,
                        itemBuilder: (context, index) {
                          return Text(
                            '• ${movieDetails.genres[index]} ',
                            style: Styles.textStyle(
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 7.0, bottom: 5),
                    child: Icon(
                      Iconsax.star1,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    movieDetails.voteAverage.toStringAsFixed(1),
                    style: Styles.textStyle(
                      color: AppColors.greyColor,
                      weight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(${movieDetails.voteCount})',
                    style: Styles.textStyle(
                      color: AppColors.greyColor,
                      weight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('•'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    movieDetails.releaseDate != ''
                        ? Helper.getYear(
                            DateTime.parse(movieDetails.releaseDate))
                        : '0',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle(
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('•'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Helper.minutesToHours(movieDetails.runtime),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Styles.textStyle(
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            movieDetails.videos.isNotEmpty
                ? Positioned(
                    right: 20,
                    bottom: 40,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          await Helper.launchVideoUrl(
                            Helper.generateVideoUrl(movieDetails.videos),
                          );
                        },
                        icon: const Icon(
                          Iconsax.play,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Helper.isDark(context)
                        ? AppColors.greyColorDark
                        : AppColors.greyColorLight,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Icon(
                    Iconsax.arrow_circle_left,
                    color: Helper.isDark(context)
                        ? AppColors.purpleColorDark
                        : AppColors.purpleColorLight,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => _checkIsFavOrNotBeforeSubmit(
                  context,
                  isFavorite,
                  movieDetails,
                ),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Helper.isDark(context)
                        ? AppColors.greyColorDark
                        : AppColors.greyColorLight,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Icon(
                    Iconsax.heart,
                    color: isFavorite
                        ? AppColors.redColor
                        : Helper.isDark(context)
                            ? AppColors.purpleColorDark
                            : AppColors.purpleColorLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void _checkIsFavOrNotBeforeSubmit(
    BuildContext context, bool isFav, MovieDetailsEntity movieDetails) {
  if (isFav) {
    context
        .read<MovieDetailsBloc>()
        .add(ClickedFavoriteButtonToDelete(movieId: movieDetails.id));
  } else {
    context
        .read<MovieDetailsBloc>()
        .add(ClickedFavoriteButtonToAdd(movie: movieDetails));
  }
  context
      .read<MovieDetailsBloc>()
      .add(CheckMovieISFavoriteOrNotEvent(movieId: movieDetails.id));
}
