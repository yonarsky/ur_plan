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

    return await openDatabase(path, version: 1);
  }

  Future<List<Courses>> getAllCourses(college) async {
    final db = await database;
    var response = await db.rawQuery('SELECT * FROM kierunki WHERE id_kierunki LIKE ?', ['%$college%']);
    List<Courses> list = response.map(
            (s) => Courses.fromMap(s)
    ).toList();
    db.close();
    return list;
  }

  Future<List<Subjects>> getYears(idKier) async {
    final db = await database;
    var response = await db.rawQuery('SELECT * FROM zajecia WHERE id_kierunek LIKE ? GROUP BY rok', ['$idKier']);
    List<Subjects> list = response.map(
            (s) => Subjects.fromMap(s)
    ).toList();
    db.close();
    return list;
  }

  Future<List<Days>> getDays() async {
    final db = await database;
    var response = await db.rawQuery('SELECT * FROM dni');
    List<Days> list = response.map(
            (s) => Days.fromMap(s)
    ).toList();
    db.close();
    return list;
  }
}



class Courses {
  final String id_kierunki;
  final String nazwa_kierunku;

  Courses({this.id_kierunki, this.nazwa_kierunku});

  factory Courses.fromMap(
      Map<String, dynamic> map) => new Courses(
      id_kierunki: map["id_kierunki"],
      nazwa_kierunku: map["nazwa_kierunku"]
  );

  Map<String, dynamic> toMap() => {
    "id_kierunki": id_kierunki,
    "nazwa_kierunku": nazwa_kierunku,
  };
}

class Subjects {
  final int id;
  final int id_przedmiot;
  final String id_kierunek;
  final int id_dnia;
  final int id_typu;
  final int id_prowadzacy;
  final int id_sala;
  final String tydzen;
  final String godzina;
  final int rok;

  Subjects({this.id, this.id_dnia, this.godzina, this.id_kierunek, this.id_prowadzacy, this.id_przedmiot, this.id_sala, this.id_typu, this.rok, this.tydzen});

  factory Subjects.fromMap(
      Map<String, dynamic> map) => new Subjects(
      id: map["id"],
      id_przedmiot: map["id_przedmiot"],
      id_kierunek: map["id_kierunek"],
      id_dnia: map["id_dnia"],
      id_typu: map["id_typu"],
      id_prowadzacy: map["id_prowadzacy"],
      id_sala: map["id_sala"],
      tydzen: map["tydzen"],
      godzina: map["godzina"],
      rok: map["rok"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "id_przedmiot": id_przedmiot,
    "id_kierunek": id_kierunek,
    "id_dnia": id_dnia,
    "id_typu": id_typu,
    "id_prowadzacy": id_prowadzacy,
    "id_sala": id_sala,
    "tydzen": tydzen,
    "godzina": godzina,
    "rok": rok
  };
}

class GroupType {
  final int id_typu;
  final String typ_grupy;

  GroupType({this.id_typu, this.typ_grupy});

  factory GroupType.fromMap(
      Map<String, dynamic> map) => new GroupType(
      id_typu: map["id_typu"],
      typ_grupy: map["typ_grupy"]
  );

  Map<String, dynamic> toMap() => {
    "id_typu": id_typu,
    "typ_grupy": typ_grupy
  };
}

class Room {
  final int id_sali;
  final String numer_sali;

  Room({this.id_sali, this.numer_sali});

  factory Room.fromMap(
      Map<String, dynamic> map) => new Room(
      id_sali: map["id_sali"],
      numer_sali: map["numer_sali"]
  );

  Map<String, dynamic> toMap() => {
    "id_sali": id_sali,
    "numer_sali": numer_sali
  };
}

class Subject {
  final int id_przedmioty;
  final String nazwa_przedmiotu;
  final String skrot;

  Subject({this.id_przedmioty, this.nazwa_przedmiotu, this.skrot});

  factory Subject.fromMap(
      Map<String, dynamic> map) => new Subject(
      id_przedmioty: map["id_przedmioty"],
      nazwa_przedmiotu: map["nazwa_przedmiotu"],
      skrot: map["skrot"]
  );

  Map<String, dynamic> toMap() => {
    "id_przedmioty": id_przedmioty,
    "nazwa_przedmiotu": nazwa_przedmiotu,
    "skrot": skrot
  };
}

class Teachers {
  final int id_prowadzacy;
  final String imie_nazwisko;

  Teachers({this.id_prowadzacy, this.imie_nazwisko});

  factory Teachers.fromMap(
      Map<String, dynamic> map) => new Teachers(
      id_prowadzacy: map["id_prowadzacy"],
      imie_nazwisko: map["imie_nazwisko"],
  );

  Map<String, dynamic> toMap() => {
    "id_prowadzacy": id_prowadzacy,
    "imie_nazwisko": imie_nazwisko,
  };
}

class Days {
  final int id_dnia;
  final String dzien_tygodnia;
  bool isExpanded;

  Days({this.id_dnia, this.dzien_tygodnia, this.isExpanded: false});

  factory Days.fromMap(
      Map<String, dynamic> map) => new Days(
    id_dnia: map["id_dnia"],
    dzien_tygodnia: map["dzien_tygodnia"],
  );

  Map<String, dynamic> toMap() => {
    "id_dnia": id_dnia,
    "dzien_tygodnia": dzien_tygodnia,
  };
}