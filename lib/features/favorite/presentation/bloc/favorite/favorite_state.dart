part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<MovieDetailsEntity> favoriteMoviesList;
  final BlocStates favoriteStatus;
  final String favoriteFailure;
  final int id;

  const FavoriteState({
    this.favoriteMoviesList = const [],
    this.favoriteStatus = BlocStates.initial,
    this.favoriteFailure = '',
    this.id = 0,
  });

  FavoriteState copyWith({
    List<MovieDetailsEntity>? favoriteMoviesList,
    BlocStates? favoriteStatus,
    String? favoriteFailure,
    int? id,
  }) {
    return FavoriteState(
      favoriteMoviesList: favoriteMoviesList ?? this.favoriteMoviesList,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
      favoriteFailure: favoriteFailure ?? this.favoriteFailure,
      id: id ?? this.id,
    );
  }

  @override
  List<Object> get props => [
        favoriteMoviesList,
        favoriteStatus,
        favoriteFailure,
        id,
      ];
}

class FavoriteActionState extends FavoriteState {
  final int movieId;

  const FavoriteActionState(this.movieId) : super(id: movieId);
}
