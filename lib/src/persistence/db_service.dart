import 'package:trackr/src/persistence/persistence.dart';
import 'package:trackr/src/persistence/sqllite_service.dart';

class DbInstance {
  static final DbInstance _dbInstance = DbInstance._internal();
  static final dbVersion = 1;
  static Persistence _db;

  DbInstance._internal();

  factory DbInstance() {
    return _dbInstance;
  }

  static Future<Persistence> get db async {
    if (_db == null) {
      _db = SqlLiteService();
      await _db.initialize();
    }
    return _db;
  }
}
