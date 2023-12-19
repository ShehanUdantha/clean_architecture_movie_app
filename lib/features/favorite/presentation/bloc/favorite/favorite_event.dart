part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetAllFavoriteMoviesEvent extends FavoriteEvent {}

class UpdateFavoriteMoviesEvent extends FavoriteEvent {}

class DeleteFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;

  const DeleteFavoriteMovieEvent({required this.movieId});
}

class SetFavoriteToDefault extends FavoriteEvent {}
