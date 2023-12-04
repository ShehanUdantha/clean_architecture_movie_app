part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity movieDetails;
  final BlocStates status;
  final String failure;
  final String localFavoriteFailure;
  final List<MovieDetailsEntity> addedList;
  final bool isFavorite;
  final String snackMessage;

  const MovieDetailsState({
    this.movieDetails = const MovieDetailsEntity(
      id: 0,
      backdropPath: '',
      title: '',
      overview: '',
      posterPath: '',
      voteAverage: 0,
      releaseDate: '',
      runtime: 0,
      voteCount: 0,
      tagline: '',
      videos: '',
      genres: [],
      reviews: [],
      credits: [],
    ),
    this.failure = '',
    this.status = BlocStates.initial,
    this.localFavoriteFailure = '',
    this.addedList = const [],
    this.isFavorite = false,
    this.snackMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetails,
    BlocStates? status,
    String? failure,
    String? localFavoriteFailure,
    List<MovieDetailsEntity>? addedList,
    bool? isFavorite,
    String? snackMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      localFavoriteFailure: localFavoriteFailure ?? this.localFavoriteFailure,
      addedList: addedList ?? this.addedList,
      isFavorite: isFavorite ?? this.isFavorite,
      snackMessage: snackMessage ?? this.snackMessage,
    );
  }

  @override
  List<Object> get props => [
        movieDetails,
        failure,
        status,
        localFavoriteFailure,
        addedList,
        isFavorite,
        snackMessage,
      ];
}
