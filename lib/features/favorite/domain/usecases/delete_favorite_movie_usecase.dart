import '../../../../core/domain/entities/movie_details_entity.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteFavoriteMovieUseCase
    extends UseCase<List<MovieDetailsEntity>, int> {
  final FavoriteRepository favoriteRepository;

  DeleteFavoriteMovieUseCase(this.favoriteRepository);
  @override
  Future<Either<Failure, List<MovieDetailsEntity>>> call(int params) async {
    return favoriteRepository.deleteFavoriteMovie(params);
  }
}
