import '../../../../core/error/failure.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMoviesByQueryUseCase extends UseCase<List<MovieEntity>, String> {
  final MovieRepository movieRepository;

  GetMoviesByQueryUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String params) async {
    return await movieRepository.getMoviesByQuery(params);
  }
}
