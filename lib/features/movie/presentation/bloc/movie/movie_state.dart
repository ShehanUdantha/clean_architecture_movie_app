part of 'movie_bloc.dart';

class MovieState extends Equatable {
  // list of movies
  final List<MovieEntity> upcomingMovies;
  final List<MovieEntity> trendingMovies;
  final List<MovieEntity> popularMovies;
  final List<MovieEntity> allMoviesByGenres;
  final List<MovieEntity> allMoviesByQuery;

  // status
  final BlocStates upcomingMoviesStatus;
  final BlocStates trendingMoviesStatus;
  final BlocStates popularMoviesStatus;
  final BlocStates allMoviesByGenresStatus;
  final BlocStates allMoviesByQueryStatus;

  // failure
  final String upcomingMoviesFailure;
  final String trendingMoviesFailure;
  final String popularMoviesFailure;
  final String allMoviesByGenresFailure;
  final String allMoviesByQueryFailure;

  final bool isSearchBarFocus;

  const MovieState({
    this.upcomingMovies = const [],
    this.trendingMovies = const [],
    this.popularMovies = const [],
    this.allMoviesByGenres = const [],
    this.allMoviesByQuery = const [],
    this.upcomingMoviesStatus = BlocStates.initial,
    this.trendingMoviesStatus = BlocStates.initial,
    this.popularMoviesStatus = BlocStates.initial,
    this.allMoviesByGenresStatus = BlocStates.initial,
    this.allMoviesByQueryStatus = BlocStates.initial,
    this.upcomingMoviesFailure = '',
    this.trendingMoviesFailure = '',
    this.popularMoviesFailure = '',
    this.allMoviesByGenresFailure = '',
    this.allMoviesByQueryFailure = '',
    this.isSearchBarFocus = false,
  });

  MovieState copyWith({
    List<MovieEntity>? upcomingMovies,
    List<MovieEntity>? trendingMovies,
    List<MovieEntity>? popularMovies,
    List<MovieEntity>? allMoviesByGenres,
    List<MovieEntity>? allMoviesByQuery,
    BlocStates? upcomingMoviesStatus,
    BlocStates? trendingMoviesStatus,
    BlocStates? popularMoviesStatus,
    BlocStates? allMoviesByGenresStatus,
    BlocStates? allMoviesByQueryStatus,
    String? upcomingMoviesFailure,
    String? trendingMoviesFailure,
    String? popularMoviesFailure,
    String? allMoviesByGenresFailure,
    String? allMoviesByQueryFailure,
    bool? isSearchBarFocus,
  }) {
    return MovieState(
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      allMoviesByGenres: allMoviesByGenres ?? this.allMoviesByGenres,
      allMoviesByQuery: allMoviesByQuery ?? this.allMoviesByQuery,
      upcomingMoviesStatus: upcomingMoviesStatus ?? this.upcomingMoviesStatus,
      trendingMoviesStatus: trendingMoviesStatus ?? this.trendingMoviesStatus,
      popularMoviesStatus: popularMoviesStatus ?? this.popularMoviesStatus,
      allMoviesByGenresStatus:
          allMoviesByGenresStatus ?? this.allMoviesByGenresStatus,
      allMoviesByQueryStatus:
          allMoviesByQueryStatus ?? this.allMoviesByQueryStatus,
      upcomingMoviesFailure:
          upcomingMoviesFailure ?? this.upcomingMoviesFailure,
      trendingMoviesFailure:
          trendingMoviesFailure ?? this.trendingMoviesFailure,
      popularMoviesFailure: popularMoviesFailure ?? this.popularMoviesFailure,
      allMoviesByGenresFailure:
          allMoviesByGenresFailure ?? this.allMoviesByGenresFailure,
      allMoviesByQueryFailure:
          allMoviesByQueryFailure ?? this.allMoviesByQueryFailure,
      isSearchBarFocus: isSearchBarFocus ?? this.isSearchBarFocus,
    );
  }

  @override
  List<Object> get props => [
        upcomingMovies,
        trendingMovies,
        popularMovies,
        allMoviesByGenres,
        allMoviesByQuery,
        upcomingMoviesStatus,
        trendingMoviesStatus,
        popularMoviesStatus,
        allMoviesByGenresStatus,
        allMoviesByQueryStatus,
        upcomingMoviesFailure,
        trendingMoviesFailure,
        popularMoviesFailure,
        allMoviesByGenresFailure,
        allMoviesByQueryFailure,
        isSearchBarFocus,
      ];
}
