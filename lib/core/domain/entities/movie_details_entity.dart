import 'package:equatable/equatable.dart';

import '../../../features/movie/domain/entities/movie_credit_entity.dart';
import '../../../features/movie/domain/entities/review_entity.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final int voteCount;
  final String tagline;
  final String videos;
  final List<String> genres;
  final List<ReviewEntity> reviews;
  final List<MovieCreditEntity> credits;

  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.voteCount,
    required this.tagline,
    required this.videos,
    required this.genres,
    required this.reviews,
    required this.credits,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        backdropPath,
        posterPath,
        voteAverage,
        releaseDate,
        runtime,
        voteCount,
        tagline,
        videos,
        genres,
        reviews,
        credits,
      ];
}
