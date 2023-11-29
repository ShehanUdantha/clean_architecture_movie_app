import '../../../../core/data/data_sources/local/movie_local_data_source.dart';
import '../../../../core/data/models/movie_details_model.dart';

import '../../../../core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final MovieLocalDataSource movieLocalDataSource;

  FavoriteRepositoryImpl(this.movieLocalDataSource);

  @override
  Future<Either<Failure, List<MovieDetailsModel>>>
      getAllFavoriteMovies() async {
    try {
      final result = await movieLocalDataSource.getAllMovies();
      return Right(result);
    } catch (e) {
      return Left(LocalDBFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> deleteFavoriteMovie(
      int id) async {
    try {
      final result = await movieLocalDataSource.removeMovie(id);
      return Right(result);
    } catch (e) {
      return Left(LocalDBFailure(errorMessage: e.toString()));
    }
  }
}
