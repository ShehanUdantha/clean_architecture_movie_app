import 'package:clean_architecture_movie_app/core/constant/strings.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/models/movie_details_model.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/utils/helper.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final Dio dio;

  MovieDetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    try {
      final response =
          await dio.get(Helper.generateMovieDetailsUrl(movieId.toString()));
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromMap(response.data);
      } else {
        throw ServerException(
          errorMessage: response.data,
          stackTrace: null,
        );
      }
    } on DioException catch (dioError) {
      throw ServerException(
        errorMessage: dioError.response?.data != null
            ? dioError.response!.data.toString()
            : dioError.response?.statusMessage ??
                Strings.somethingWentWrongMessage,
        stackTrace: null,
      );
    } on ServerException catch (e) {
      throw ServerException(
        errorMessage: e.errorMessage,
        stackTrace: e.stackTrace,
      );
    } catch (e, stackTrace) {
      throw ServerException(
        errorMessage: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
