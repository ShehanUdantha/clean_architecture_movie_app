import '../data/data_sources/local/movie_local_data_source.dart';
import '../../features/favorite/data/repositories/favorite_repository_impl.dart';
import '../../features/favorite/domain/repositories/favorite_repository.dart';
import '../domain/usecase/delete_favorite_movie_usecase.dart';
import '../../features/favorite/domain/usecases/get_all_favorite_movies_usecase.dart';
import '../../features/favorite/presentation/bloc/favorite/favorite_bloc.dart';
import '../../features/movie/data/data_sources/remote/movie_details_remote_data_source.dart';
import '../../features/movie/data/repositories/movie_details_repository_impl.dart';
import '../../features/movie/domain/repositories/movie_details_repository.dart';
import '../../features/movie/domain/usecases/add_movie_to_favorite_usecase.dart';
import '../../features/movie/domain/usecases/check_movie_favorite_or_not_usecase.dart';

import '../../features/movie/domain/usecases/get_movies_by_query_usecase.dart';

import '../../features/movie/domain/usecases/get_movie_by_genre_usecase.dart';
import '../../features/movie/presentation/bloc/movie/movie_bloc.dart';

import '../../features/movie/data/data_sources/remote/movie_remote_data_source.dart';
import '../../features/movie/data/repositories/movie_repository_impl.dart';
import '../../features/movie/domain/repositories/movie_repository.dart';
import '../../features/movie/domain/usecases/get_movie_details_usecase.dart';
import '../../features/movie/domain/usecases/get_popular_movies_usecase.dart';
import '../../features/movie/domain/usecases/get_trending_movies_usecase.dart';
import '../../features/movie/domain/usecases/get_upcoming_movies_usecase.dart';
import '../../features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  // dio
  sl.registerSingleton<Dio>(Dio());

  // data sources
  sl.registerSingleton<MovieRemoteDataSource>(MovieRemoteDataSourceImpl(sl()));
  sl.registerSingleton<MovieDetailsRemoteDataSource>(
      MovieDetailsRemoteDataSourceImpl(sl()));
  sl.registerSingleton<MovieLocalDataSource>(MovieLocalDataSourceImpl());

  // repositories
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(sl()));
  sl.registerSingleton<MovieDetailsRepository>(
      MovieDetailsRepositoryImpl(sl(), sl()));
  sl.registerSingleton<FavoriteRepository>(FavoriteRepositoryImpl(sl()));

  // usecases
  sl.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(sl()));
  sl.registerSingleton<GetUpComingMoviesUseCase>(
      GetUpComingMoviesUseCase(sl()));
  sl.registerSingleton<GetTrendingMoviesUseCase>(
      GetTrendingMoviesUseCase(sl()));
  sl.registerSingleton<GetMovieDetailsUseCase>(GetMovieDetailsUseCase(sl()));
  sl.registerSingleton<GetMovieByGenreUseCase>(GetMovieByGenreUseCase(sl()));
  sl.registerSingleton<GetMoviesByQueryUseCase>(GetMoviesByQueryUseCase(sl()));
  sl.registerSingleton<AddMovieToFavoriteUseCase>(
      AddMovieToFavoriteUseCase(sl()));
  sl.registerSingleton<GetAllFavoriteMoviesUseCase>(
      GetAllFavoriteMoviesUseCase(sl()));
  sl.registerSingleton<DeleteFavoriteMovieUseCase>(
      DeleteFavoriteMovieUseCase(sl()));
  sl.registerSingleton<CheckMovieFavoriteOrNotUseCase>(
      CheckMovieFavoriteOrNotUseCase(sl()));

  // blocs
  sl.registerFactory<MovieBloc>(() => MovieBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory<MovieDetailsBloc>(
      () => MovieDetailsBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory<FavoriteBloc>(() => FavoriteBloc(sl(), sl()));
}
