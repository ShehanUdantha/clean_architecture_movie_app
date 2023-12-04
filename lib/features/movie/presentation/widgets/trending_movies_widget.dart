// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_movie_app/core/presentation/widgets/list_horizontal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/route_names.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/presentation/widgets/list_vertical_card_widget.dart';

class TrendingMoviesWidget extends StatelessWidget {
  final CardTypes type;

  const TrendingMoviesWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(type);
  }
}

_bodyWidget(CardTypes type) {
  return BlocBuilder<MovieBloc, MovieState>(
    builder: (context, state) {
      switch (state.trendingMoviesStatus) {
        case BlocStates.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case BlocStates.success:
          return ListView.builder(
            scrollDirection:
                type == CardTypes.vertical ? Axis.horizontal : Axis.vertical,
            controller: type == CardTypes.vertical
                ? context.read<MovieBloc>().trendingScrollControllerHorizontal
                : context.read<MovieBloc>().trendingScrollControllerVertical,
            physics: const BouncingScrollPhysics(),
            itemCount: state.trendingMovies.length + 1,
            itemBuilder: (context, index) {
              if (index < state.trendingMovies.length) {
                return GestureDetector(
                  onTap: () {
                    context.goNamed(
                      RouteNames.movieDetailsPageName,
                      queryParameters: {
                        'movieId': state.trendingMovies[index].id.toString(),
                      },
                    );
                  },
                  child: type == CardTypes.vertical
                      ? ListVerticalCardWidget(
                          movie: state.trendingMovies[index],
                        )
                      : ListHorizontalCardWidget(
                          movie: state.trendingMovies[index],
                        ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        case BlocStates.error:
          return Center(
            child: Text(state.trendingMoviesFailure),
          );
        default:
          return const SizedBox();
      }
    },
  );
}
