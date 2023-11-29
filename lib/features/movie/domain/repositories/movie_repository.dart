import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getUpComingMovies();

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(int page);

  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies(int page);

  Future<Either<Failure, List<MovieEntity>>> getMovieByGenre(int genreId);

  Future<Either<Failure, List<MovieEntity>>> getMoviesByQuery(String query);
}
