import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetTrendingMoviesUseCase implements UseCase<List<MovieEntity>, int> {
  final MovieRepository movieRepository;

  GetTrendingMoviesUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(int params) async {
    return await movieRepository.getTrendingMovies(params);
  }
}
