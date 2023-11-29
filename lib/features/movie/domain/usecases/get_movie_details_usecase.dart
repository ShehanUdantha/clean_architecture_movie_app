import '../repositories/movie_details_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../../../../core/domain/entities/movie_details_entity.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailsUseCase extends UseCase<MovieDetailsEntity, int> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetailsUseCase(this.movieDetailsRepository);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(int params) async {
    return await movieDetailsRepository.getMovieDetails(params);
  }
}
