import 'package:go_router/go_router.dart';

import '../../../../core/constant/lists.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/route_names.dart';
import 'genre_card_widget.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _bodyWidget();
  }
}

_bodyWidget() {
  const genres = Lists.listOfGenres;
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: genres.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          context.goNamed(
            RouteNames.allMoviePageName,
            queryParameters: {
              'title': genres[index]['name'],
              'genreId': genres[index]['id'].toString(),
            },
          );
        },
        child: ListGenresCardWidget(genre: genres[index]),
      );
    },
  );
}
