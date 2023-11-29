import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    id,
    backdropPath,
    genres,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
  }) : super(
          id: id,
          backdropPath: backdropPath,
          genres: genres,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
        id: map['id'],
        backdropPath: map['backdrop_path'] ?? '',
        genres: List<int>.from((map["genre_ids"] as List).map((e) => e)),
        originalTitle: map['original_title'] ?? '',
        overview: map['overview'],
        popularity: map['popularity'] ?? 0.0,
        posterPath: map['poster_path'] ?? map['backdrop_path'] ?? '',
        releaseDate: map['release_date'] ?? '',
        title: map['title'],
        video: map['video'] ?? false,
        voteAverage: map['vote_average'],
        voteCount: map['vote_count'],
      );
}
