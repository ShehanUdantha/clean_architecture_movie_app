import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetUpComingMoviesUseCase implements UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetUpComingMoviesUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getUpComingMovies();
  }
}
