import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/strings.dart';
import '../../../../core/constant/styles.dart';
import '../../../../core/presentation/widgets/list_horizontal_card_widget.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/helper.dart';
import '../../../movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import '../bloc/favorite/favorite_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MovieRay',
          style: Styles.textStyle(
            size: 26,
            weight: FontWeight.bold,
            color: Helper.isDark(context)
                ? AppColors.textColorDark
                : AppColors.textColorLight,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _bodyWidget(),
        ),
      ),
    );
  }
}

_bodyWidget() {
  return BlocConsumer<FavoriteBloc, FavoriteState>(
    listener: (context, state) {
      if (state.favoriteStatus == BlocStates.error) {
        Helper.showSnackBar(context, state.favoriteFailure);
      }
      if (state.favoriteActionStatus == BlocStates.error) {
        Helper.showSnackBar(context, state.favoriteFailure);
      }
      if (state.favoriteActionStatus == BlocStates.success) {
        if (state.favoriteMessage == 'removed') {
          Helper.showSnackBar(context, Strings.movieRemoved);
          context.read<FavoriteBloc>().add(UpdateFavoriteMoviesEvent());
          context.read<FavoriteBloc>().add(SetFavoriteToDefault());
          context
              .read<MovieDetailsBloc>()
              .add(CheckMovieISFavoriteOrNotEvent(movieId: state.id));
        }
      }
    },
    builder: (context, state) {
      switch (state.favoriteStatus) {
        case BlocStates.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case BlocStates.success:
          if (state.favoriteMoviesList.isNotEmpty) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: state.favoriteMoviesList.length,
              itemBuilder: (context, index) {
                return ListHorizontalCardWidget(
                  movie: state.favoriteMoviesList[index],
                  isFav: true,
                  function: () {
                    context.read<FavoriteBloc>().add(
                          DeleteFavoriteMovieEvent(
                            movieId: state.favoriteMoviesList[index].id,
                          ),
                        );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text(Strings.moviesNotAddedYet),
            );
          }

        case BlocStates.error:
          return Center(
            child: Text(state.favoriteFailure),
          );
        default:
          return const SizedBox();
      }
    },
  );
}
