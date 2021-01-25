import 'package:trackr/src/persistence/persistence.dart';
import 'package:trackr/src/persistence/sqllite_service.dart';

class DbService {
  static final DbService _dbInstance = DbService._internal();
  static final dbVersion = 1;
  static Persistence _dbService;

  DbService._internal();

  factory DbService() {
    return _dbInstance;
  }

  static Future<Persistence> get db async {
    if (_dbService == null) {
      _dbService = SqlLiteService();
      await _dbService.initialize();
    }
    return _dbService;
  }
}
