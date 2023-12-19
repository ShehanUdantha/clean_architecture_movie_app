import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/movie_details_entity.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repositories/favorite_repository.dart';

class GetAllFavoriteMoviesUseCase
    extends UseCase<List<MovieDetailsEntity>, NoParams> {
  final FavoriteRepository favoriteRepository;

  GetAllFavoriteMoviesUseCase(this.favoriteRepository);
  @override
  Future<Either<Failure, List<MovieDetailsEntity>>> call(
      NoParams params) async {
    return await favoriteRepository.getAllFavoriteMovies();
  }
}
