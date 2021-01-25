import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trackr/src/model/data_item.dart';

import 'persistence.dart';

class SqlLiteService implements Persistence {
  Future<Database> database;

  Future<void> initialize() async {
    // Open the database and store the reference.
    database = openDatabase(
      join(await getDatabasesPath(), 'trackr.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          '''CREATE TABLE user(
                id INTEGER PRIMARY KEY,
                firstname TEXT,
                lastname TEXT,
                username TEXT)''',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertItem(DataItem dataItem) async {
    // Get a reference to the database.
    final Database db = await database;

    // In this case, replace any previous data if there is a conflict.
    await db.insert(
      dataItem.runtimeType.toString(),
      dataItem.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
