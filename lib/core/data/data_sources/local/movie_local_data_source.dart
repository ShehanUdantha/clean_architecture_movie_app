import '../../../constant/db_constant.dart';
import '../../models/movie_details_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class MovieLocalDataSource {
  Future<List<MovieDetailsModel>> addMovie(MovieDetailsModel movie);
  Future<List<MovieDetailsModel>> getAllMovies();
  Future<List<MovieDetailsModel>> removeMovie(int id);
  Future<bool> checkFavorite(int id);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  Future<Database> initDatabase() async {
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
  }

  Future<bool> checkDuplicate(int id, String column) async {
    final db = await initDatabase();
    List<Map> result = await db
        .query(DBConstant.dbTableMovie, where: '$column = ?', whereArgs: [id]);
    return result.isEmpty;
  }

  @override
  Future<List<MovieDetailsModel>> getAllMovies() async {
    final db = await initDatabase();
    final tableData = await db.query(DBConstant.dbTableMovie);

    return List<MovieDetailsModel>.from(
      tableData.map(
        (e) => MovieDetailsModel.fromLocalMap(e),
      ),
    );
  }

  @override
  Future<List<MovieDetailsModel>> addMovie(MovieDetailsModel movie) async {
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
  }

  @override
  Future<List<MovieDetailsModel>> removeMovie(int id) async {
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
  }

  // return value should be false, if id already in the db
  @override
  Future<bool> checkFavorite(int id) async {
    // wait for the half of second to store a data before check value
    return Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
      () async => await checkDuplicate(id, DBConstant.columnMovieId),
    );
  }
}
