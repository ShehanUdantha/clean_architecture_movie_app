import '../../domain/entities/movie_favorite_entity.dart';

class MovieFavoriteModel extends MovieFavoriteEntity {
  const MovieFavoriteModel({
    id,
    movieList,
  }) : super(
          movieList: movieList,
          id: id,
        );
}
