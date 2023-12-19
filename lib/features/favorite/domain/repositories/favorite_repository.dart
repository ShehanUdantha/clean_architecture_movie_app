import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/movie_details_entity.dart';
import '../../../../core/error/failure.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<MovieDetailsEntity>>> getAllFavoriteMovies();
  Future<Either<Failure, List<MovieDetailsEntity>>> deleteFavoriteMovie(int id);
}
