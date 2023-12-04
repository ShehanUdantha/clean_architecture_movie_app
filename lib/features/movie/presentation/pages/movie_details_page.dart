// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_movie_app/core/utils/helper.dart';
import 'package:clean_architecture_movie_app/features/favorite/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../widgets/movie_details_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;

  const MovieDetailsPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(movieId: movieId))
        ..add(
          CheckMovieISFavoriteOrNotEvent(movieId: movieId),
        ),
      child: Scaffold(
        body: _bodyWidget(),
      ),
    );
  }
}

_bodyWidget() {
  return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
    listenWhen: (previous, current) =>
        current.isFavorite != previous.isFavorite,
    listener: (context, state) {
      if (state.snackMessage != '') {
        Helper.showSnackBar(context, state.snackMessage);
        context
            .read<FavoriteBloc>()
            .add(UpdateFavoriteMoviesEvent(state.addedList));
      }
    },
    builder: (context, state) {
      switch (state.status) {
        case BlocStates.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case BlocStates.success:
          return MovieDetailsWidget(
            movieDetails: state.movieDetails,
            isFavorite: state.isFavorite,
          );
        case BlocStates.error:
          return Center(
            child: Text(state.failure),
          );
        default:
          return const SizedBox();
      }
    },
  );
}
