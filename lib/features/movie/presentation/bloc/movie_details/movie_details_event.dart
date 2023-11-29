part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent({required this.movieId});
}

class AddMovieToFavoriteEvent extends MovieDetailsEvent {
  final MovieDetailsEntity movie;

  const AddMovieToFavoriteEvent({required this.movie});
}

class CheckMovieISFavoriteOrNotEvent extends MovieDetailsEvent {
  final int movieId;

  const CheckMovieISFavoriteOrNotEvent(this.movieId);
}
