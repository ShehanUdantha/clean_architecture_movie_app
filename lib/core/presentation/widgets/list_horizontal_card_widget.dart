import 'package:cached_network_image/cached_network_image.dart';
import '../../constant/colors.dart';
import '../../../features/favorite/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/api_constant.dart';
import '../../constant/styles.dart';
import '../../utils/helper.dart';

class ListHorizontalCardWidget extends StatelessWidget {
  final dynamic movie;
  final bool isFav;
  const ListHorizontalCardWidget({
    Key? key,
    required this.movie,
    this.isFav = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        children: [
          Container(
            height: Helper.screeWidth(context) * 0.425,
            padding: const EdgeInsets.all(5.0).copyWith(top: 6, left: 6),
            decoration: const BoxDecoration(
              color: AppColors.greyDark,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: movie.posterPath != ''
                          ? Helper.generateImageUrl(movie.posterPath)
                          : APIConstant.defaultMovieImage,
                      imageBuilder: (context, imageProvider) => Container(
                        height: Helper.screeWidth(context) * 0.42,
                        width: Helper.screeWidth(context) * 0.29,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Container(
                      height: Helper.screeWidth(context) * 0.42,
                      width: Helper.screeWidth(context) * 0.29,
                      decoration: Styles.linearBoxDecoration(radius: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: isFav
                          ? Helper.screeWidth(context) * 0.5
                          : Helper.screeWidth(context) * 0.58,
                      child: Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Styles.textStyle(size: 18),
                      ),
                    ),
                    SizedBox(
                      width: Helper.screeWidth(context) * 0.58,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                movie.releaseDate != ''
                                    ? Helper.getYear(
                                        DateTime.parse(movie.releaseDate))
                                    : '0',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style:
                                    Styles.textStyle(weight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Icon(
                                  Iconsax.star1,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                movie.voteAverage.toStringAsFixed(1),
                                style: Styles.textStyle(
                                  color: AppColors.grey,
                                  weight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(${movie.voteCount})',
                                style: Styles.textStyle(
                                  color: AppColors.grey,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            movie.overview,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: Styles.textStyle(
                              size: 13,
                              weight: FontWeight.w400,
                            ),
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          isFav
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<FavoriteBloc>()
                          .add(DeleteFavoriteMovieEvent(movieId: movie.id));
                    },
                    icon: const Icon(
                      Iconsax.bag,
                      color: AppColors.redColor,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
