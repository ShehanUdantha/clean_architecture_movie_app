// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/presentation/widgets/list_horizontal_card_widget.dart';
import '../bloc/movie/movie_bloc.dart';
import '../pages/movie_details_page.dart';

class GenreMoviesWidget extends StatelessWidget {
  final int id;
  const GenreMoviesWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(id);
  }
}

_bodyWidget(int id) {
  return BlocProvider(
    create: (context) =>
        sl<MovieBloc>()..add(GetMoviesByGenreEvent(genreId: id)),
    child: BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (state.allMoviesByGenresStatus) {
          case BlocStates.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case BlocStates.success:
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: state.allMoviesByGenres.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MovieDetailsPage(
                          movieId: state.allMoviesByGenres[index].id,
                        ),
                      ),
                    );
                  },
                  child: ListHorizontalCardWidget(
                    movie: state.allMoviesByGenres[index],
                  ),
                );
              },
            );
          case BlocStates.error:
            return Center(
              child: Text(state.allMoviesByGenresFailure),
            );
          default:
            return const SizedBox();
        }
      },
    ),
  );
}
