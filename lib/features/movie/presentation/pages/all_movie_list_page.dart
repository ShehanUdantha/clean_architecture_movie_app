import '../../../../core/utils/enum.dart';
import '../../../../core/utils/helper.dart';
import '../widgets/popular_movies_widget.dart';
import '../widgets/trending_movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/styles.dart';
import '../widgets/genre_movies_widget.dart';

class AllMoviePage extends StatelessWidget {
  final String title;
  final MoviesList? type;
  final int? genreId;

  const AllMoviePage({
    Key? key,
    required this.title,
    this.type,
    this.genreId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(title, context),
      body: _bodyWidget(type, genreId, context),
    );
  }
}

_appBarWidget(String title, BuildContext context) {
  return AppBar(
    title: Text(
      'All $title Movies',
      style: Styles.textStyle(
        size: 18,
        weight: FontWeight.bold,
        color: Helper.isDark(context)
            ? AppColors.textColorDark
            : AppColors.textColorLight,
      ),
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
    leading: Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
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
      ],
    ),
  );
}

_bodyWidget(MoviesList? type, int? genreId, BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Helper.screeHeight(context) * 0.9,
              child: genreId != null
                  ? GenreMoviesWidget(id: genreId)
                  : _getWidget(type),
            ),
          ],
        ),
      ),
    ),
  );
}

_getWidget(MoviesList? type) {
  switch (type) {
    case MoviesList.trending:
      return const TrendingMoviesWidget(
        type: CardTypes.horizontal,
      );
    case MoviesList.popular:
      return const PopularMoviesWidget(
        type: CardTypes.horizontal,
      );
    default:
      return const SizedBox();
  }
}
