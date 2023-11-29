part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<MovieDetailsEntity> favoriteMoviesList;
  final BlocStates favoriteStatus;
  final String favoriteFailure;

  const FavoriteState({
    this.favoriteMoviesList = const [],
    this.favoriteStatus = BlocStates.initial,
    this.favoriteFailure = '',
  });

  FavoriteState copyWith({
    List<MovieDetailsEntity>? favoriteMoviesList,
    BlocStates? favoriteStatus,
    String? favoriteFailure,
  }) {
    return FavoriteState(
      favoriteMoviesList: favoriteMoviesList ?? this.favoriteMoviesList,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
      favoriteFailure: favoriteFailure ?? this.favoriteFailure,
    );
  }

  @override
  List<Object> get props => [
        favoriteMoviesList,
        favoriteStatus,
        favoriteFailure,
      ];
}

class FavoriteActionState extends FavoriteState {}

class IsDeletedEvent extends FavoriteActionState {}
