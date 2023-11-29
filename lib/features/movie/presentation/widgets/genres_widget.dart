import '../../../../core/constant/lists.dart';
import 'package:flutter/material.dart';

import '../pages/all_movie_list_page.dart';
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AllMoviePage(
                title: genres[index]['name'],
                genreId: genres[index]['id'],
              ),
            ),
          );
        },
        child: ListGenresCardWidget(genre: genres[index]),
      );
    },
  );
}
