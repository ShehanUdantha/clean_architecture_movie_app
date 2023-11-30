// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_movie_by_genre_usecase.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_movies_by_query_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_movie_app/core/utils/enum.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/movie_entity.dart';

import '../../../../../core/domain/usecase/usecase.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_trending_movies_usecase.dart';
import '../../../domain/usecases/get_upcoming_movies_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetUpComingMoviesUseCase getUpComingMoviesUseCase;
  final GetTrendingMoviesUseCase getTrendingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetMovieByGenreUseCase getMovieByGenreUseCase;
  final GetMoviesByQueryUseCase getMoviesByQueryUseCase;

  int trendingPageNumber = 1;
  int popularPageNumber = 1;

  ScrollController trendingScrollControllerVertical = ScrollController();
  ScrollController popularScrollControllerVertical = ScrollController();
  ScrollController trendingScrollControllerHorizontal = ScrollController();
  ScrollController popularScrollControllerHorizontal = ScrollController();

  MovieBloc(
    this.getUpComingMoviesUseCase,
    this.getTrendingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getMovieByGenreUseCase,
    this.getMoviesByQueryUseCase,
  ) : super(const MovieState()) {
    on<GetUpComingMoviesEvent>(onGetUpComingMoviesEvent);
    on<GetTrendingMoviesEvent>(onGetTrendingMoviesEvent);
    on<GetMoreTrendingMoviesEvent>(onGetMoreTrendingMoviesEvent);
    on<GetPopularMoviesEvent>(onGetPopularMoviesEvent);
    on<GetMorePopularMoviesEvent>(onGetMorePopularMoviesEvent);
    on<GetMoviesByGenreEvent>(onGetMoviesByGenreEvent);
    on<GetMoviesByQueryEvent>(onGetMoviesByQueryEvent);
    on<SearchBarFocusEvent>(onSearchBarFocusEvent);

// listen to card vertical scroll
    trendingScrollControllerVertical.addListener(() {
      if (trendingScrollControllerVertical.position.pixels ==
          trendingScrollControllerVertical.position.maxScrollExtent) {
        add(GetMoreTrendingMoviesEvent());
      }
    });

    popularScrollControllerVertical.addListener(() {
      if (popularScrollControllerVertical.position.pixels ==
          popularScrollControllerVertical.position.maxScrollExtent) {
        add(GetMorePopularMoviesEvent());
      }
    });

// listen to card horizontal scroll
    trendingScrollControllerHorizontal.addListener(() {
      if (trendingScrollControllerHorizontal.position.pixels ==
          trendingScrollControllerHorizontal.position.maxScrollExtent) {
        add(GetMoreTrendingMoviesEvent());
      }
    });

    popularScrollControllerHorizontal.addListener(() {
      if (popularScrollControllerHorizontal.position.pixels ==
          popularScrollControllerHorizontal.position.maxScrollExtent) {
        add(GetMorePopularMoviesEvent());
      }
    });
  }

// upcoming movies
  FutureOr<void> onGetUpComingMoviesEvent(
    GetUpComingMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(upcomingMoviesStatus: BlocStates.loading));
    final result = await getUpComingMoviesUseCase.call(NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          upcomingMoviesStatus: BlocStates.error,
          upcomingMoviesFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          upcomingMoviesStatus: BlocStates.success,
          upcomingMovies: r,
        ),
      ),
    );
  }

// trending movies
  FutureOr<void> onGetTrendingMoviesEvent(
    GetTrendingMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(trendingMoviesStatus: BlocStates.loading));
    final result = await getTrendingMoviesUseCase.call(trendingPageNumber);
    result.fold(
      (l) => emit(
        state.copyWith(
          trendingMoviesStatus: BlocStates.error,
          trendingMoviesFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          trendingMoviesStatus: BlocStates.success,
          trendingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> onGetMoreTrendingMoviesEvent(
    GetMoreTrendingMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    trendingPageNumber++;

    final result = await getTrendingMoviesUseCase.call(trendingPageNumber);

    result.fold(
      (l) => emit(
        state.copyWith(
          trendingMoviesStatus: BlocStates.error,
          trendingMoviesFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          trendingMoviesStatus: BlocStates.success,
          trendingMovies: state.trendingMovies + r,
        ),
      ),
    );
  }

// popular movies
  FutureOr<void> onGetPopularMoviesEvent(
    GetPopularMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(popularMoviesStatus: BlocStates.loading));
    final result = await getPopularMoviesUseCase.call(popularPageNumber);
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMoviesStatus: BlocStates.error,
          popularMoviesFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMoviesStatus: BlocStates.success,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> onGetMorePopularMoviesEvent(
    GetMorePopularMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    popularPageNumber++;

    final result = await getPopularMoviesUseCase.call(popularPageNumber);

    result.fold(
      (l) => emit(
        state.copyWith(
          popularMoviesStatus: BlocStates.error,
          popularMoviesFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMoviesStatus: BlocStates.success,
          popularMovies: state.popularMovies + r,
        ),
      ),
    );
  }

// movies by genre
  FutureOr<void> onGetMoviesByGenreEvent(
    GetMoviesByGenreEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(allMoviesByGenresStatus: BlocStates.loading));
    final result = await getMovieByGenreUseCase.call(event.genreId);
    result.fold(
      (l) => emit(
        state.copyWith(
          allMoviesByGenresStatus: BlocStates.error,
          allMoviesByGenresFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          allMoviesByGenresStatus: BlocStates.success,
          allMoviesByGenres: r,
        ),
      ),
    );
  }

// movies by query
  FutureOr<void> onGetMoviesByQueryEvent(
    GetMoviesByQueryEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(allMoviesByQueryStatus: BlocStates.loading));
    final result = await getMoviesByQueryUseCase.call(event.query);
    result.fold(
      (l) => emit(
        state.copyWith(
          allMoviesByQueryStatus: BlocStates.error,
          allMoviesByQueryFailure: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          allMoviesByQueryStatus: BlocStates.success,
          allMoviesByQuery: r,
        ),
      ),
    );
  }

// search bar focus
  FutureOr<void> onSearchBarFocusEvent(
    SearchBarFocusEvent event,
    Emitter<MovieState> emit,
  ) {
    emit(
      state.copyWith(
        isSearchBarFocus: event.isFocus,
        allMoviesByQueryStatus: event.isFocus == false
            ? BlocStates.initial
            : state.allMoviesByQueryStatus,
      ),
    );
  }
}
