import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/constant/styles.dart';
import '../../../../core/utils/helper.dart';
import '../../domain/entities/movie_entity.dart';

class UpComingCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const UpComingCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.backdropPath != ''
                ? Helper.generateImageUrl(movie.backdropPath)
                : APIConstant.defaultMovieImage,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Center(
              child: Lottie.asset(
                'assets/lotties/loading.json',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: Styles.linearBoxDecoration(),
          ),
          Positioned(
            bottom: 6,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Up Coming..',
                    style: Styles.textStyle(
                      size: 10,
                      weight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              padding: const EdgeInsets.all(10.0).copyWith(right: 0),
              width: Helper.screeWidth(context) * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Styles.textStyle(size: 21),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    Helper.formatDate(DateTime.parse(movie.releaseDate)),
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle(
                      size: 12,
                      weight: FontWeight.w500,
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
