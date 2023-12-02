import '../../../../core/domain/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/domain/entities/movie_details_entity.dart';
import '../repositories/movie_details_repository.dart';
import 'package:dartz/dartz.dart';

class AddMovieToFavoriteUseCase
    extends UseCase<List<MovieDetailsEntity>, MovieDetailsEntity> {
  final MovieDetailsRepository movieDetailsRepository;
  AddMovieToFavoriteUseCase(this.movieDetailsRepository);

  @override
  Future<Either<Failure, List<MovieDetailsEntity>>> call(
      MovieDetailsEntity params) {
    return movieDetailsRepository.addMovieToFavorite(params);
  }
}
