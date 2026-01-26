import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton()
class AppDatabase {
  final _dbName = 'erasica.db';
  final _dbVersion = 1;

  Database? db;

  Future<Database> init() async {
    if (db != null) return db!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    db = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    return db!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await _createTables(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    for (var v = oldVersion + 1; v <= newVersion; v++) {
      final migration = _migrations[v];
      if (migration != null) {
        await migration(db);
      }
    }
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE photos (
        id TEXT PRIMARY KEY,
        photo_path TEXT NOT NULL,
        created_at INTEGER NOT NULL
      );
    ''');
  }

  final Map<int, Future<void> Function(Database)> _migrations = {};
}
