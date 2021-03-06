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
    var icon = type == RecordType.cost.index ? costIconMapping[subType] : incomeIconMapping[subType];

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
                color: Color(0xFF0099CC),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: Text(name),
              )
            ],)
          ),
          Text('${type == 1 ? "+" : "-"} ${amount.toStringAsFixed(2)}', 
            style: TextStyle(
              color: type == 1 ? Color(0xFF009933) : Color(0xFF990033)
            ),
          )
        ],
      ),
    );
  }
}