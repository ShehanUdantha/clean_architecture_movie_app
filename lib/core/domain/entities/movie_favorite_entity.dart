// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_movie_app/core/domain/entities/movie_details_entity.dart';
import 'package:equatable/equatable.dart';

class MovieFavoriteEntity extends Equatable {
  final int id;
  final List<MovieDetailsEntity> movieList;

  const MovieFavoriteEntity({
    required this.id,
    required this.movieList,
  });

  @override
  List<Object?> get props => [
        id,
        movieList,
      ];
}
