import '../data_sources/remote/movie_details_remote_data_source.dart';
import '../../../../core/domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/data_sources/local/movie_local_data_source.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/data/models/movie_details_model.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  MovieDetailsRepositoryImpl(
    this.movieDetailsRemoteDataSource,
    this.movieLocalDataSource,
  );
  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      int movieId) async {
    try {
      final result =
          await movieDetailsRemoteDataSource.getMovieDetails(movieId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> addMovieToFavorite(
      MovieDetailsEntity movie) async {
    try {
      final result = await movieLocalDataSource
          .addMovie(MovieDetailsModel.fromEntity(movie));
      return Right(result);
    } on LocalException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> checkMovieFavorite(int movieId) async {
    try {
      final result = await movieLocalDataSource.checkFavorite(movieId);
      return Right(result);
    } on LocalException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> deleteFavoriteMovie(
      int id) async {
    try {
      final result = await movieLocalDataSource.removeMovie(id);
      return Right(result);
    } on LocalException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }
}
