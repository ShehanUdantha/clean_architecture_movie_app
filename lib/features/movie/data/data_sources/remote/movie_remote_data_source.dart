import '../../../../../core/constant/api_constant.dart';
import '../../../../../core/error/exception.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/helper.dart';
import '../../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getUpComingMovies();
  Future<List<MovieModel>> getPopularMovies(int page);
  Future<List<MovieModel>> getTrendingMovies(int page);
  Future<List<MovieModel>> getMoviesByGenre(int genreId);
  Future<List<MovieModel>> getMoviesByQuery(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MovieModel>> getUpComingMovies() async {
    final response = await dio.get(APIConstant.upcomingUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromMap(e),
        ),
      );
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies(int page) async {
    final response = await dio.get(Helper.generatePopularUrl(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromMap(e),
        ),
      );
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies(int page) async {
    final response = await dio.get(Helper.generateTrendingUrl(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromMap(e),
        ),
      );
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getMoviesByGenre(int genreId) async {
    final response = await dio.get(Helper.generateGenreUrl(genreId.toString()));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromMap(e),
        ),
      );
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getMoviesByQuery(String query) async {
    final response = await dio.get(Helper.generateSearchUrl(query));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromMap(e),
        ),
      );
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }
}
