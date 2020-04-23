import 'package:flutter/material.dart';
import './amountCell.dart';
import '../utils/constants.dart' show appBgColor;

class SummaryCell extends StatelessWidget {
  final double cellHeight;
  final DateTime selectedDate;
  final String totalCost;
  final String totalIncome;
  final onDateSelected;
  
  SummaryCell({
    Key key ,
    @required this.cellHeight,
    @required this.selectedDate,
    @required this.totalCost,
    @required this.totalIncome,
    @required this.onDateSelected
  }):super(key:key);

  @override
  Widget build(BuildContext context) {  
    return Container(      
      decoration: BoxDecoration(
        color: Color(appBgColor),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: selectedDate.subtract(Duration(days: 365)),
                lastDate: DateTime.now(),
              ).then((value) {
                if (value == null) {
                  return;
                }
                
                this.onDateSelected(value);
              });
            },
            child: Container(
              height: cellHeight,
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
              decoration: BoxDecoration(
                color: Color(appBgColor),
                border: Border(right: BorderSide(width: 0.3, color: Color(0xFFF2F3F4)))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedDate.year}年',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${selectedDate.month}',
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
                      Icon(Icons.arrow_drop_down,color: Colors.white,size:30)
                    ],
                  ),
                ],
              ),
            ),
          ),
          AmountCell(cellHeight: cellHeight, title: '支出(元)', desc: '$totalCost'),
          AmountCell(cellHeight: cellHeight, title: '收入(元)', desc: '$totalIncome'),
        ]
      )
    );   
  }
}