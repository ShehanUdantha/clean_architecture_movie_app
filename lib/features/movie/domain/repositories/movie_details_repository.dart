import '../../../../core/domain/entities/movie_favorite_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);
  Future<Either<Failure, MovieFavoriteEntity>> addMovieToFavorite(
      MovieDetailsEntity movie);
  Future<Either<Failure, bool>> checkMovieFavorite(int movieId);
}
