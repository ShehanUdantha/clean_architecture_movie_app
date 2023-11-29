part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity movieDetails;
  final BlocStates status;
  final String failure;
  final int recodeId;
  final String recordFailure;
  final List<MovieDetailsEntity> addedList;
  final bool isFavorite;

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
    this.recodeId = 0,
    this.recordFailure = '',
    this.addedList = const [],
    this.isFavorite = false,
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetails,
    BlocStates? status,
    String? failure,
    int? recodeId,
    String? recordFailure,
    List<MovieDetailsEntity>? addedList,
    bool? isFavorite,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      recodeId: recodeId ?? this.recodeId,
      recordFailure: recordFailure ?? this.recordFailure,
      addedList: addedList ?? this.addedList,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props => [
        movieDetails,
        failure,
        status,
        recodeId,
        recordFailure,
        addedList,
        isFavorite,
      ];
}
