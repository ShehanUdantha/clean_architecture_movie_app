import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/colors.dart';
import '../../domain/entities/movie_credit_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/constant/styles.dart';
import '../../../../core/utils/helper.dart';

class MovieActorsWidget extends StatelessWidget {
  final List<MovieCreditEntity> movieCreditEntity;
  const MovieActorsWidget({
    Key? key,
    required this.movieCreditEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Actors',
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
            height: Helper.screeHeight(context) * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieCreditEntity.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: movieCreditEntity[index].profileUrl != ''
                            ? Helper.generateProfileUrl(
                                movieCreditEntity[index].profileUrl)
                            : APIConstant.defaultUserImage,
                        imageBuilder: (context, imageProvider) => Container(
                          height: Helper.screeHeight(context) * 0.2,
                          width: Helper.screeWidth(context) * 0.32,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(
                          width: Helper.screeWidth(context) * 0.32,
                          child: Center(
                            child: Lottie.asset(
                              'assets/lotties/loading.json',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Helper.screeHeight(context) * 0.2,
                        width: Helper.screeWidth(context) * 0.32,
                        decoration: Styles.linearBoxDecoration(),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Container(
                          padding: const EdgeInsets.all(10.0).copyWith(
                            right: 0,
                            bottom: 5,
                          ),
                          width: Helper.screeWidth(context) * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieCreditEntity[index].name,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: Styles.textStyle(size: 15),
                              ),
                            ],
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
