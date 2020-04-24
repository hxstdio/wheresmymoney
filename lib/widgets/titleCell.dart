import 'package:flutter/material.dart';
import '../utils/constants.dart' show weekMapping;

class TitleCell extends StatelessWidget {
  final int createDate;
  final double income;
  final double cost;
  
  TitleCell({
    Key key ,
    @required this.createDate,
    @required this.income,
    @required this.cost,
  }):super(key:key);  

  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(createDate);
    var day = date.day;
    var weekDay = date.weekday;

    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      decoration: BoxDecoration(
        color: Color(0x4FCCCCCC),
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xF2F3F4FF)))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$day日 - 星期${weekMapping[weekDay - 1]}'),
          Text('支出:$cost  收入:$income'),
        ],
      ),
    );
  }
}