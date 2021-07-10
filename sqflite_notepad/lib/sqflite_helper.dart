import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? db;

  DatabaseHelper() {
    openDB();
  }

  Future<String> get dbPath async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    return join(databasesPath, 'demo.db');
  }

  // Delete the database
  deleteDB() async {
    await deleteDatabase(await dbPath);
  }

  // open the database
  openDB() async {
    this.db = await openDatabase(await dbPath, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY, title TEXT, data INTEGER, date TEXT)');
    });
  }

  // insert into database
  insertData(String title, String data, String date) {
    db!.rawInsert(
      "INSERT INTO notes(title, data, date) VALUES( ? ,?, ?)",
      [title, data, date],
    );
    print(db!.rawQuery("SELECT * FROM notes"));
  }

  Future<List> getData() async {
    List<Map> data = await db!.rawQuery("SELECT * FROM notes");
    return data;
  }

  deleteData(int id) async {
    await db!.rawDelete("DELETE FROM notes WHERE id = ?", [id]);
  }
}
