// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

// movie details get event
class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent({required this.movieId});
}

// favorite movie events
class ClickedFavoriteButtonToAdd extends MovieDetailsEvent {
  final MovieDetailsEntity movie;

  const ClickedFavoriteButtonToAdd({required this.movie});
}

class ClickedFavoriteButtonToDelete extends MovieDetailsEvent {
  final int movieId;

  const ClickedFavoriteButtonToDelete({required this.movieId});
}

class CheckMovieISFavoriteOrNotEvent extends MovieDetailsEvent {
  final int movieId;

  const CheckMovieISFavoriteOrNotEvent({required this.movieId});
}

class SetMovieDetailsStatusToDefaultEvent extends MovieDetailsEvent {}
