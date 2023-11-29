import '../../../../core/error/failure.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieByGenreUseCase extends UseCase<List<MovieEntity>, int> {
  final MovieRepository movieRepository;

  GetMovieByGenreUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
    int params,
  ) async {
    return await movieRepository.getMovieByGenre(params);
  }
}
