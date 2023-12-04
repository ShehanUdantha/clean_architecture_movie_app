import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../constant/api_constant.dart';
import '../../constant/colors.dart';
import '../../constant/styles.dart';
import '../../utils/helper.dart';

class ListVerticalCardWidget extends StatelessWidget {
  final dynamic movie;

  const ListVerticalCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.posterPath != ''
                ? Helper.generateImageUrl(movie.posterPath)
                : APIConstant.defaultMovieImage,
            imageBuilder: (context, imageProvider) => Container(
              width: Helper.screeWidth(context) * 0.40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => SizedBox(
              width: Helper.screeWidth(context) * 0.40,
              child: Center(
                child: Lottie.asset(
                  'assets/lotties/loading.json',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            width: Helper.screeWidth(context) * 0.40,
            decoration: Styles.linearBoxDecoration(),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              padding: const EdgeInsets.all(10.0).copyWith(right: 0),
              width: Helper.screeWidth(context) * 0.38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Styles.textStyle(size: 17),
                  ),

                  // display only two genres
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '• ${Helper.getGenreById(movie.genres)[0]} ',
                        style: Styles.textStyle(
                          size: 11,
                          weight: FontWeight.w500,
                        ),
                      ),
                      // ignore: unnecessary_null_comparison
                      movie.genres.length > 1
                          ? SizedBox(
                              width: Helper.screeWidth(context) * 0.16,
                              child: Text(
                                ' • ${Helper.getGenreById(movie.genres)[1]}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: Styles.textStyle(
                                  size: 11,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              padding: const EdgeInsets.only(
                right: 6,
                bottom: 1,
              ),
              decoration: const BoxDecoration(
                color: AppColors.greyColorDark,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.star1,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    movie.voteAverage.toStringAsFixed(1),
                    style: Styles.textStyle(
                      color: AppColors.greyColor,
                      weight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
