import 'package:flutter/material.dart';

class AmountCell extends StatelessWidget {
  final String title;
  final String desc;
  final double cellHeight;

  AmountCell({
    Key key ,
    @required this.title,
    @required this.desc,
    @required this.cellHeight
  }):super(key:key);

  @override
  Widget build(BuildContext context) {  
    return Expanded(
      child: Container(
        height: cellHeight,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 5.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            )
          ],
        ),
      ),
    );
  }
}