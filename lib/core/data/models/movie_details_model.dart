import '../../constant/db_constant.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../../features/movie/data/models/movie_credit_model.dart';
import '../../../features/movie/data/models/review_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
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
    video,
    videos,
    genres,
    reviews,
    credits,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          backdropPath: backdropPath,
          posterPath: posterPath,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          runtime: runtime,
          voteCount: voteCount,
          tagline: tagline,
          videos: videos,
          genres: genres,
          reviews: reviews,
          credits: credits,
        );

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) =>
      MovieDetailsModel(
        id: map['id'],
        title: map['title'],
        overview: map['overview'],
        backdropPath: map['backdrop_path'] ?? map['poster_path'] ?? '',
        posterPath: map['poster_path'] ?? '',
        voteAverage: map['vote_average'],
        releaseDate: map['release_date'],
        runtime: map['runtime'],
        voteCount: map['vote_count'],
        tagline: map['tagline'],
        videos: map['videos']['results'][0]['key'] ?? '',
        genres: List<String>.from(
          (map['genres'] as List).map(
            (e) => e['name'],
          ),
        ),
        reviews: List<ReviewModel>.from(
          (map['reviews']['results'] as List).map(
            (e) => ReviewModel.fromMap(e),
          ),
        ),
        credits: List<MovieCreditModel>.from(
          (map['credits']['cast'] as List).map(
            (e) => MovieCreditModel.fromMap(e),
          ),
        ),
      );

  factory MovieDetailsModel.fromLocalMap(Map<String, dynamic> map) =>
      MovieDetailsModel(
        id: map[DBConstant.columnMovieId],
        title: map[DBConstant.columnTitle],
        overview: map[DBConstant.columnDescription],
        posterPath: map[DBConstant.columnImage],
        voteAverage: map[DBConstant.columnVoteAverage],
        releaseDate: map[DBConstant.columnYear],
        voteCount: map[DBConstant.columnVoteCount],
        backdropPath: '',
        runtime: 0,
        tagline: '',
        video: false,
        videos: '',
        genres: const <String>[],
        reviews: const <ReviewModel>[],
        credits: const <MovieCreditModel>[],
      );

  factory MovieDetailsModel.fromEntity(MovieDetailsEntity movieEntity) =>
      MovieDetailsModel(
        id: movieEntity.id,
        title: movieEntity.title,
        overview: movieEntity.overview,
        backdropPath: movieEntity.backdropPath,
        posterPath: movieEntity.posterPath,
        voteAverage: movieEntity.voteAverage,
        releaseDate: movieEntity.releaseDate,
        runtime: movieEntity.runtime,
        voteCount: movieEntity.voteCount,
        tagline: movieEntity.tagline,
        videos: movieEntity.videos,
        genres: movieEntity.genres,
        reviews: movieEntity.reviews,
        credits: movieEntity.credits,
      );
}
