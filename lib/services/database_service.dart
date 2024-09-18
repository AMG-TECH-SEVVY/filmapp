//ervice pour la gestion de la base de données locale
import 'dart:async';
import 'package:filmapp/models/review.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:filmapp/models/movie.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'movie_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movies(
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        releaseDate TEXT
      )
    ''');
  }

  Future<void> insertMovie(Movie movie) async {
    final db = await database;

    await db.insert(
      'movies',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Movie>> getMovies() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('movies');

    return List.generate(maps.length, (i) {
     return Movie(
  id: maps[i]['id'],
  title: maps[i]['title'],
  overview: maps[i]['overview'],
  posterPath: maps[i]['posterPath'],
  releaseDate: maps[i]['releaseDate'],
  backDropPath:maps[i]['backDropPath'],
  rating: (maps[i]['rating'] as num?)?.toDouble() ?? 0.0, // Assurez-vous de convertir en double
  genres: (maps[i]['genres'] as List<dynamic>?)?.map((genre) => genre.toString()).toList() ?? [], // Conversion en liste de chaînes
  reviews: (maps[i]['reviews'] as List<dynamic>?)?.map((review) => Review.fromMap(review)).toList() ?? [], // Conversion en liste de Review
);

    });
  }
}

