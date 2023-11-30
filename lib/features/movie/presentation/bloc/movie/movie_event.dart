part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

// upcoming movies event
class GetUpComingMoviesEvent extends MovieEvent {}

// trending movies events
class GetTrendingMoviesEvent extends MovieEvent {}

class GetMoreTrendingMoviesEvent extends MovieEvent {}

// popular movies events
class GetPopularMoviesEvent extends MovieEvent {}

class GetMorePopularMoviesEvent extends MovieEvent {}

// movies by genre event
class GetMoviesByGenreEvent extends MovieEvent {
  final int genreId;

  const GetMoviesByGenreEvent({required this.genreId});
}

// movies by query event
class GetMoviesByQueryEvent extends MovieEvent {
  final String query;

  const GetMoviesByQueryEvent({required this.query});
}

// search bar focus event
class SearchBarFocusEvent extends MovieEvent {
  final bool isFocus;

  const SearchBarFocusEvent({required this.isFocus});
}
