import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper {

  // method to get or initialize the db connection
  static Future<sql.Database> database() async {

    final dbPath = await sql.getDatabasesPath();
  
    return sql.openDatabase(
      path.join(dbPath,'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
      version: 1
    );
  
  }

  // insert a new record into the database
  static Future<void> insert(String table, Map<String,Object?> data) async{
    final db = await DbHelper.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  // Fetch all data from a table
  static Future<List<Map<String,dynamic>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }




}