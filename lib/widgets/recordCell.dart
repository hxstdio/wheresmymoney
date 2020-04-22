import 'package:flutter/material.dart';
import '../models/enums.dart' show RecordType;
import '../utils/constants.dart' show costIconMapping, incomeIconMapping;

class RecordCell extends StatelessWidget {
  final int type;
  final int subType;
  final String name;
  final double amount;
  
  RecordCell({
    Key key ,
    @required this.type,
    @required this.subType,
    @required this.name,
    @required this.amount,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {  
    var icon = type == RecordType.cost.index ? costIconMapping[type] : incomeIconMapping[type];
    var iconColor = type == RecordType.cost.index ? Colors.orange : Colors.lightGreen;

    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 5, 10.0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
            child: Row(children: [
              Icon(
                icon['icon'],
                color: iconColor,
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: Text(name),
              )
            ],)
          ),
          Text('${type == 1 ? "+" : "-"} $amount')
        ],
      ),
    );
  }
}