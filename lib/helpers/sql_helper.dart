import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper{

  static Future<sql.Database> _database() async{
    final dbPath= await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, "places.db"), version: 1, onCreate: (db, version){
      db.execute("CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, locLat, REAL, locLng REAL, address TEXT)");
    });
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async{
    final db= await DbHelper._database();
    await db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async{
    final db= await DbHelper._database();
    return db.query(table);
  }
}













//import 'package:sqflite/sqflite.dart' as sql;
//import 'package:path/path.dart' as path;
//import 'dart:io';
//
//class DbHelper{
//
//  static Future<sql.Database> database() async{
//    final dbPath= await sql.getDatabasesPath();
//    return sql.openDatabase(path.join(dbPath, "places.db"), version: 1, onCreate: (db, version){
//      db.execute("CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, locLat REAL, locLng REAL, address TEXT)");
//    });
//  }
//
//  static Future<void> insert(String table, Map<String, dynamic> data) async{
//    final db= await DbHelper.database();
//    await db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
//  }
//
//  static Future<List<Map<String, dynamic>>> getData(String table) async{
//    final db= await DbHelper.database();
//    return db.query(table);
//  }
//}