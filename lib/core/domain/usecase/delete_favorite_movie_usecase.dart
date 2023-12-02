import '../entities/movie_details_entity.dart';
import 'usecase.dart';
import '../../error/failure.dart';
import '../../../features/favorite/domain/repositories/favorite_repository.dart';
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
