import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum.dart';
import '../../../../core/utils/helper.dart';
import '../bloc/movie/movie_bloc.dart';
import '../pages/movie_details_page.dart';
import 'upcoming_card_widget.dart';

class UpComingMoviesWidget extends StatelessWidget {
  const UpComingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _bodyWidget();
  }
}

_bodyWidget() {
  return BlocBuilder<MovieBloc, MovieState>(
    builder: (context, state) {
      switch (state.upcomingMoviesStatus) {
        case BlocStates.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case BlocStates.success:
          return SizedBox(
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: state.upcomingMovies.length,
              itemBuilder: ((context, index, realIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MovieDetailsPage(
                          movieId: state.upcomingMovies[index].id,
                        ),
                      ),
                    );
                  },
                  child: UpComingCardWidget(movie: state.upcomingMovies[index]),
                );
              }),
              options: CarouselOptions(
                height: Helper.screeHeight(context) * 0.3,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1),
              ),
            ),
          );

        case BlocStates.error:
          return Center(
            child: Text(state.upcomingMoviesFailure),
          );
        default:
          return const SizedBox();
      }
    },
  );
}
