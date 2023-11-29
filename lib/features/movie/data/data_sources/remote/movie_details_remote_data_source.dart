import 'package:dio/dio.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/data/models/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final Dio dio;

  MovieDetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response =
        await dio.get(Helper.generateMovieDetailsUrl(movieId.toString()));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromMap(response.data);
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }
}
