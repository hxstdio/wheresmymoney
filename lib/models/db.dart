import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './record.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper.internal();
  factory DataBaseHelper() => _instance;
  final String dbName = "wheresmymoney";
  final String tableName = "records";
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DataBaseHelper.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$dbName.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $tableName (
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT,
          $columnType INTEGER,
          $columnSubType INTEGER,
          $columnAmount REAL,
          $columnCreateDate INTEGER
        )
      ''');
  }

  Future<List> getItemByMonth(DateTime dateTime) async {
    var dbClient = await db;

    var year = dateTime.year;
    var monthStr = dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    var firstDayOfMonth = DateTime.parse('$year-$monthStr-01').millisecondsSinceEpoch;
    
    var nextTagYear = dateTime.month == 12 ? dateTime.year + 1 : dateTime.year;
    var nextTagMonth = dateTime.month == 12 ? 1 : dateTime.month + 1;
    var nextTagMonthStr = nextTagMonth < 10 ? '0${nextTagMonth}' : '${nextTagMonth}';
    var firstDayOfNextMonth = DateTime.parse('$nextTagYear-$nextTagMonthStr-01').millisecondsSinceEpoch;
    
    var sqlStr = "SELECT * FROM $tableName WHERE $columnCreateDate >= $firstDayOfMonth AND $columnCreateDate < $firstDayOfNextMonth";
    var result = await dbClient.rawQuery(sqlStr);
    return result.toList();
  }

  Future<List> getItemByMs(int dateTimeInMs) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE $columnCreateDate = $dateTimeInMs");
    return result.toList();
  }

  Future<List> getItemByTest() async {
    var start = 1582992000000;
    var end = 1585670400000;
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE $columnCreateDate >= $start AND $columnCreateDate < $end");
    return result.toList();
  }

  Future<List> getTotalList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName");
    return result.toList();
  }

  Future<int> saveItem(Record record) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", record.toMap());
    return res;
  }

  Future<int> clear() async {
    var dbClient = await db;
    return await dbClient.delete(tableName);
  }
}