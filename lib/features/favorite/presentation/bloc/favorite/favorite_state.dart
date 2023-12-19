part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<MovieDetailsEntity> favoriteMoviesList;
  final BlocStates favoriteStatus;
  final String favoriteFailure;
  final int id;
  final BlocStates favoriteActionStatus;
  final String favoriteMessage;

  const FavoriteState({
    this.favoriteMoviesList = const [],
    this.favoriteStatus = BlocStates.initial,
    this.favoriteFailure = '',
    this.id = 0,
    this.favoriteActionStatus = BlocStates.initial,
    this.favoriteMessage = '',
  });

  FavoriteState copyWith({
    List<MovieDetailsEntity>? favoriteMoviesList,
    BlocStates? favoriteStatus,
    String? favoriteFailure,
    int? id,
    BlocStates? favoriteActionStatus,
    String? favoriteMessage,
  }) {
    return FavoriteState(
      favoriteMoviesList: favoriteMoviesList ?? this.favoriteMoviesList,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
      favoriteFailure: favoriteFailure ?? this.favoriteFailure,
      id: id ?? this.id,
      favoriteActionStatus: favoriteActionStatus ?? this.favoriteActionStatus,
      favoriteMessage: favoriteMessage ?? this.favoriteMessage,
    );
  }

  @override
  List<Object> get props => [
        favoriteMoviesList,
        favoriteStatus,
        favoriteFailure,
        id,
        favoriteActionStatus,
        favoriteMessage,
      ];
}
