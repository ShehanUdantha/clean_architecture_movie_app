import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../../core/domain/usecase/delete_favorite_movie_usecase.dart';
import '../../../domain/usecases/check_movie_favorite_or_not_usecase.dart';
import '../../../../../core/utils/enum.dart';
import '../../../../../core/domain/entities/movie_details_entity.dart';
import '../../../domain/usecases/add_movie_to_favorite_usecase.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import 'package:equatable/equatable.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final AddMovieToFavoriteUseCase addMovieToFavoriteUseCase;
  final CheckMovieFavoriteOrNotUseCase checkMovieFavoriteOrNotUseCase;
  final DeleteFavoriteMovieUseCase deleteFavoriteMovieUseCase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.addMovieToFavoriteUseCase,
    this.checkMovieFavoriteOrNotUseCase,
    this.deleteFavoriteMovieUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(onGetMovieDetailsEvent);
    on<ClickedFavoriteButtonToAdd>(onClickedFavoriteButtonToAdd);
    on<ClickedFavoriteButtonToDelete>(onClickedFavoriteButtonToDelete);
    on<CheckMovieISFavoriteOrNotEvent>(onCheckMovieISFavoriteOrNotEvent);
    on<SetMovieDetailsStatusToDefaultEvent>(
        onSetMovieDetailsStatusToDefaultEvent);
  }

// movie details
  FutureOr<void> onGetMovieDetailsEvent(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BlocStates.loading));
    final result = await getMovieDetailsUseCase.call(event.movieId);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: BlocStates.error,
          failure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: BlocStates.success,
          movieDetails: r,
        ),
      ),
    );
  }

// favorite movies
  FutureOr<void> onClickedFavoriteButtonToAdd(
    ClickedFavoriteButtonToAdd event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await addMovieToFavoriteUseCase.call(event.movie);
    result.fold(
      (l) => emit(
        state.copyWith(
          actionStatus: BlocStates.error,
          localFavoriteFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          snackMessage: 'added',
          actionStatus: BlocStates.success,
        ),
      ),
    );
  }

  FutureOr<void> onClickedFavoriteButtonToDelete(
    ClickedFavoriteButtonToDelete event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await deleteFavoriteMovieUseCase.call(event.movieId);

    result.fold(
      (l) => emit(
        state.copyWith(
          actionStatus: BlocStates.error,
          localFavoriteFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          snackMessage: 'removed',
          actionStatus: BlocStates.success,
        ),
      ),
    );
  }

  FutureOr<void> onCheckMovieISFavoriteOrNotEvent(
    CheckMovieISFavoriteOrNotEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await checkMovieFavoriteOrNotUseCase.call(event.movieId);
    result.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(
          isFavorite: !r,
        ),
      ),
    );
  }

  FutureOr<void> onSetMovieDetailsStatusToDefaultEvent(
    SetMovieDetailsStatusToDefaultEvent event,
    Emitter<MovieDetailsState> emit,
  ) {
    emit(
      state.copyWith(
        snackMessage: '',
        actionStatus: BlocStates.initial,
      ),
    );
  }
}
