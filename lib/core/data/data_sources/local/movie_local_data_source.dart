import 'package:clean_architecture_movie_app/core/error/exception.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constant/db_constant.dart';
import '../../models/movie_details_model.dart';

abstract class MovieLocalDataSource {
  Future<List<MovieDetailsModel>> addMovie(MovieDetailsModel movie);
  Future<List<MovieDetailsModel>> getAllMovies();
  Future<List<MovieDetailsModel>> removeMovie(int id);
  Future<bool> checkFavorite(int id);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  Future<Database> initDatabase() async {
    try {
      final path = await getDatabasesPath();
      final dbPath = join(path, DBConstant.dbName);

      return await openDatabase(
        dbPath,
        version: DBConstant.dbVersion,
        onCreate: (db, version) async {
          return await db.execute('''CREATE TABLE ${DBConstant.dbTableMovie}(
          ${DBConstant.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
          ${DBConstant.columnMovieId} INTEGER NOT NULL ,
          ${DBConstant.columnTitle} TEXT ,
          ${DBConstant.columnImage} TEXT ,
          ${DBConstant.columnYear} TEXT ,
          ${DBConstant.columnVoteAverage} DOUBLE ,
          ${DBConstant.columnVoteCount} INTEGER ,
          ${DBConstant.columnDescription} TEXT 
        )''');
        },
      );
    } catch (e, stackTrace) {
      throw LocalException(
        errorMessage: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  Future<bool> checkDuplicate(int id, String column) async {
    try {
      final db = await initDatabase();
      List<Map> result = await db.query(DBConstant.dbTableMovie,
          where: '$column = ?', whereArgs: [id]);
      return result.isEmpty;
    } catch (e, stackTrace) {
      throw LocalException(
        errorMessage: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MovieDetailsModel>> getAllMovies() async {
    try {
      final db = await initDatabase();
      final tableData = await db.query(DBConstant.dbTableMovie);

      return List<MovieDetailsModel>.from(
        tableData.map(
          (e) => MovieDetailsModel.fromLocalMap(e),
        ),
      );
    } on LocalException catch (e) {
      throw LocalException(
        errorMessage: e.errorMessage,
        stackTrace: e.stackTrace,
      );
    } catch (e, stackTrace) {
      throw LocalException(
        errorMessage: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MovieDetailsModel>> addMovie(MovieDetailsModel movie) async {
    try {
      final db = await initDatabase();

      final result = await checkDuplicate(movie.id, DBConstant.columnMovieId);

      result
          ? await db.insert(DBConstant.dbTableMovie, {
              DBConstant.columnMovieId: movie.id,
              DBConstant.columnTitle: movie.title,
              DBConstant.columnImage: movie.posterPath,
              DBConstant.columnYear: movie.releaseDate,
              DBConstant.columnVoteAverage: movie.voteAverage,
              DBConstant.columnVoteCount: movie.voteCount,
              DBConstant.columnDescription: movie.overview,
            })
          : null;
      return await getAllMovies();
    } on LocalException catch (e) {
      throw LocalException(
        errorMessage: e.errorMessage,
        stackTrace: e.stackTrace,
      );
    } catch (e, stackTrace) {
      throw LocalException(
        errorMessage: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<MovieDetailsModel>> removeMovie(int id) async {
    try {
      final db = await initDatabase();

      final result = await checkDuplicate(id, DBConstant.columnMovieId);

      if (!result) {
        await db.delete(
          DBConstant.dbTableMovie,
          where: '${DBConstant.columnMovieId} = ?',
          whereArgs: [id],
        );
      }

      return await getAllMovies();
    } on LocalException catch (e) {
      throw LocalException(
        errorMessage: e.errorMessage,
        stackTrace: e.stackTrace,
      );
    } catch (e, stackTrace) {
      throw LocalException(
        errorMessage: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  // return value should be false, if id already in the db
  @override
  Future<bool> checkFavorite(int id) async {
    try {
      // wait for the half of second to store a data before check value
      return Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
        () async => await checkDuplicate(id, DBConstant.columnMovieId),
      );
    } on LocalException catch (e) {
      throw LocalException(
        errorMessage: e.errorMessage,
        stackTrace: e.stackTrace,
      );
    } catch (e, stackTrace) {
      throw LocalException(
        errorMessage: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
