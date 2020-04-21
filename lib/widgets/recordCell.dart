import 'package:flutter/material.dart';
import '../models/enums.dart' show RecordType;

class RecordCell extends StatelessWidget {
  final int type;
  final int subType;
  final String name;
  final double amount;

  final costIconMapping = {
    0: Icons.attach_money,
    1: Icons.fastfood,
    2: Icons.shop,
    3: Icons.traffic,
    4: Icons.music_note,
    5: Icons.people_outline,
    6: Icons.home,
    7: Icons.school,
    8: Icons.nature_people,
    9: Icons.local_hospital,
  };

  final incomeIconMapping = {
    0: Icons.tag_faces,
    1: Icons.card_giftcard,
    2: Icons.payment
  };
  
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
                icon,
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