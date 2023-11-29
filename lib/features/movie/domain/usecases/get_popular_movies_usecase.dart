// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movie_app/core/error/failure.dart';
import 'package:clean_architecture_movie_app/core/domain/usecase/usecase.dart';

import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetPopularMoviesUseCase implements UseCase<List<MovieEntity>, int> {
  final MovieRepository movieRepository;

  GetPopularMoviesUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(int params) async {
    return await movieRepository.getPopularMovies(params);
  }
}
