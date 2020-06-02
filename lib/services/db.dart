import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:movieapp/models/model.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      _db = await openDatabase(join(await getDatabasesPath() + '/movieapp.db'),
          version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE movie(id INTEGER PRIMARY KEY, title TEXT, overview TEXT, release_data TEXT, poster_path TEXT, backdrop_path TEXT)');
    await db.execute('CREATE TABLE genre(id INTEGER PRIMARY KEY, name TEXT)');
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<List<Map<String, dynamic>>> queryId(String table, int id) async =>
      _db.query(table, where: 'id = ?', whereArgs: [id]);

  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async =>
      await _db.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}