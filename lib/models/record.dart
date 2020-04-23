
final String tableName = 'records';
final String columnId = '_id';
final String columnName = 'name';
final String columnType = 'type';
final String columnSubType = 'subType';
final String columnAmount = 'amount';
final String columnCreateDate = 'createDate';

class Record {
  int id;
  String name;
  int type;
  int subType;
  double amount;
  int createDate;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      columnId: id,
      columnName: name,
      columnType: type,
      columnSubType: subType,
      columnAmount: amount,
      columnCreateDate: createDate
    };

    return map;
  }

  static Record fromMap(Map<String, dynamic> map) {
    Record record = new Record();
    record.id = map[columnId];
    record.name = map[columnName];
    record.type = map[columnType];
    record.subType = map[columnSubType];
    record.amount = map[columnAmount];
    record.createDate = map[columnCreateDate];

    return record;
  }

  static List<Record> fromMapList(dynamic mapList) {
    List<Record> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }

    return list;
  }
}