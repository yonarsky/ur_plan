import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {

  // private constructor
  DatabaseProvider.internal();

  // static instance
  static final DatabaseProvider db = DatabaseProvider.internal();

  // SQLite database
  Database _database;

  Future<Database> get database async {
    if(_database != null) return databaseInstance();
    _database = await databaseInstance();
    return _database;
  }

  Future<Database> databaseInstance() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "ur_timetables_working.db");

    ByteData data = await rootBundle.load(join("databases", "ur_timetables.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    return await openDatabase(path);
  }

  Future<List<Days>> getAllDays() async {
    final db = await database;
    var response = await db.query('dni');
    List<Days> list = response.map(
            (s) => Days.fromMap(s)
    ).toList();
    return list;
  }
}

class Days {
  final int id_dnia;
  final String dzien_tygodnia;

  Days({this.id_dnia, this.dzien_tygodnia});

  factory Days.fromMap(
      Map<String, dynamic> map) => new Days(
      id_dnia: map["id_dnia"],
      dzien_tygodnia: map["dzien_tygodnia"]
  );

  Map<String, dynamic> toMap() => {
    "id_dnia": id_dnia,
    "dzien_tygodnia": dzien_tygodnia,
  };
}
