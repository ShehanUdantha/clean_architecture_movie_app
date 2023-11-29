import '../../../../core/utils/helper.dart';
import '../bloc/favorite/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/styles.dart';
import '../../../../core/presentation/widgets/list_horizontal_card_widget.dart';
import '../../../../core/utils/enum.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MovieRay',
          style: Styles.textStyle(size: 26, weight: FontWeight.bold),
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
    listenWhen: (previous, current) => current is FavoriteActionState,
    listener: (context, state) {
      Helper.showSnackBar(context, 'Movie deleted from favorite!');
    },
    buildWhen: (previous, current) => current is! FavoriteActionState,
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
                );
              },
            );
          } else {
            return const Center(
              child: Text('Movie not added yet'),
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