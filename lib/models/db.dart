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

  Future<List> getTotalList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ");
    return result.toList();
  }

  Future<int> saveItem(Record record) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", record.toMap());
    return res;
  }
}