// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_movie_app/core/presentation/widgets/list_horizontal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/movie/movie_bloc.dart';

import '../../../../core/utils/enum.dart';
import '../../../../core/presentation/widgets/list_vertical_card_widget.dart';
import '../pages/movie_details_page.dart';

class PopularMoviesWidget extends StatelessWidget {
  final CardTypes type;

  const PopularMoviesWidget({
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
      switch (state.popularMoviesStatus) {
        case BlocStates.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case BlocStates.success:
          return ListView.builder(
            scrollDirection:
                type == CardTypes.vertical ? Axis.horizontal : Axis.vertical,
            controller: type == CardTypes.vertical
                ? context.read<MovieBloc>().popularScrollControllerHorizontal
                : context.read<MovieBloc>().popularScrollControllerVertical,
            physics: const BouncingScrollPhysics(),
            itemCount: state.popularMovies.length + 1,
            itemBuilder: (context, index) {
              if (index < state.popularMovies.length) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MovieDetailsPage(
                          movieId: state.popularMovies[index].id,
                        ),
                      ),
                    );
                  },
                  child: type == CardTypes.vertical
                      ? ListVerticalCardWidget(
                          movie: state.popularMovies[index],
                        )
                      : ListHorizontalCardWidget(
                          movie: state.popularMovies[index],
                        ),
                );
              } else {
                return const Card(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        case BlocStates.error:
          return Center(
            child: Text(state.popularMoviesFailure),
          );
        default:
          return const SizedBox();
      }
    },
  );
}
