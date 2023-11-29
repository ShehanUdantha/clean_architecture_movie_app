import '../../../../core/domain/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repositories/movie_details_repository.dart';
import 'package:dartz/dartz.dart';

class CheckMovieFavoriteOrNotUseCase extends UseCase<bool, int> {
  final MovieDetailsRepository movieDetailsRepository;

  CheckMovieFavoriteOrNotUseCase(this.movieDetailsRepository);
  @override
  Future<Either<Failure, bool>> call(int params) async {
    return await movieDetailsRepository.checkMovieFavorite(params);
  }
}
