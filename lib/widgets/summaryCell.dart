import 'package:flutter/material.dart';
import './amountCell.dart';
import '../utils/constants.dart' show appBgColor;

class SummaryCell extends StatelessWidget {
  final double cellHeight;
  final int currentDate;
  final double totalCost;
  final double totalIncome;
  
  SummaryCell({
    Key key ,
    @required this.cellHeight,
    @required this.currentDate,
    @required this.totalCost,
    @required this.totalIncome,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {   
    return Container(      
      decoration: BoxDecoration(
        color: Color(appBgColor),
      ),
      child: Row(
        children: [
          Container(
            height: cellHeight,
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
            decoration: BoxDecoration(
              color: Color(appBgColor),
              border: Border(right: BorderSide(width: 0.3, color: Color(0xFFF2F3F4)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2020年',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '04',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0
                      ),
                    ),
                    Text(
                      '月',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      color: Colors.white,
                      onPressed: () {
                        print('TODO: date selection');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          AmountCell(cellHeight: cellHeight, title: '支出(元)', desc: '$totalCost'),
          AmountCell(cellHeight: cellHeight, title: '收入(元)', desc: '$totalIncome'),
        ]
      )
    );   
  }
}