// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movie_app/features/movie/data/models/movie_model.dart';
import 'package:clean_architecture_movie_app/core/error/exception.dart';
import 'package:clean_architecture_movie_app/core/error/failure.dart';
import 'package:clean_architecture_movie_app/features/movie/data/data_sources/remote/movie_remote_data_source.dart';

import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl(
    this.movieRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<MovieModel>>> getUpComingMovies() async {
    try {
      final result = await movieRemoteDataSource.getUpComingMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies(int page) async {
    try {
      final result = await movieRemoteDataSource.getPopularMovies(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrendingMovies(int page) async {
    try {
      final result = await movieRemoteDataSource.getTrendingMovies(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMovieByGenre(int genreId) async {
    try {
      final result = await movieRemoteDataSource.getMoviesByGenre(genreId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesByQuery(
      String query) async {
    try {
      final result = await movieRemoteDataSource.getMoviesByQuery(query);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        LocalDBFailure(
          errorMessage: e.errorMessage,
          stackTrace: e.stackTrace,
        ),
      );
    }
  }
}
