part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity movieDetails;
  final BlocStates status;
  final String failure;
  final String localFavoriteFailure;
  final bool isFavorite;
  final String snackMessage;
  final BlocStates actionStatus;

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
    this.isFavorite = false,
    this.snackMessage = '',
    this.actionStatus = BlocStates.initial,
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetails,
    BlocStates? status,
    String? failure,
    String? localFavoriteFailure,
    bool? isFavorite,
    String? snackMessage,
    BlocStates? actionStatus,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      localFavoriteFailure: localFavoriteFailure ?? this.localFavoriteFailure,
      isFavorite: isFavorite ?? this.isFavorite,
      snackMessage: snackMessage ?? this.snackMessage,
      actionStatus: actionStatus ?? this.actionStatus,
    );
  }

  @override
  List<Object> get props => [
        movieDetails,
        failure,
        status,
        localFavoriteFailure,
        isFavorite,
        snackMessage,
        actionStatus,
      ];
}
