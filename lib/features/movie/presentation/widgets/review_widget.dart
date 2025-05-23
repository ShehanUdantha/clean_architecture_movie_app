import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/domain/entities/movie_details_entity.dart';

class ReviewWidget extends StatelessWidget {
  final MovieDetailsEntity movieDetails;

  const ReviewWidget({
    super.key,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Reviews',
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
          SizedBox(
            height: orientation == Orientation.landscape
                ? Helper.screeHeight(context) * 0.5
                : Helper.screeHeight(context) * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieDetails.reviews.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Stack(
                    children: [
                      Container(
                        width: Helper.screeWidth(context) * 0.65,
                        decoration: BoxDecoration(
                          color: Helper.isDark(context)
                              ? AppColors.greyColorDark
                              : AppColors.greyColorLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 15,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  movieDetails.reviews[index].avatarUrl != ''
                                      ? Helper.generateAvatarUrl(
                                          movieDetails.reviews[index].avatarUrl)
                                      : APIConstant.defaultUserImage,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => SizedBox(
                                width: 40,
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/lotties/loading.json',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: Helper.screeWidth(context) * 0.5,
                                  child: Text(
                                    movieDetails.reviews[index].authorName,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: Styles.textStyle(
                                      size: 15,
                                      color: Helper.isDark(context)
                                          ? AppColors.textColorDark
                                          : AppColors.textColorLight,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Helper.screeWidth(context) * 0.5,
                                  child: RatingBar.builder(
                                    initialRating:
                                        movieDetails.reviews[index].rating,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemSize: 20,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 5,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          width: Helper.screeWidth(context) * 0.6,
                          child: Text(
                            movieDetails.reviews[index].content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            textAlign: TextAlign.start,
                            style: Styles.textStyle(
                              size: 14,
                              weight: FontWeight.w400,
                              color: Helper.isDark(context)
                                  ? AppColors.textColorDark
                                  : AppColors.textColorLight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
