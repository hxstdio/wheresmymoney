import 'package:flutter/material.dart';

class SummaryCell extends StatelessWidget {
  final int currentDate;
  final double totalCost;
  final double totalIncome;
  
  SummaryCell({
    Key key ,
    @required this.currentDate,
    @required this.totalCost,
    @required this.totalIncome,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {      
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                height: 180.0,
                padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border(right: BorderSide(width: 0.5, color: Color(0xF2F3F4FF)))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(
                child: Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'data222222222222222222222222222',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      Text(
                        '00000',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]
          ),
          Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.orange,
            )
          )
        ]
      ),
    );
  }
}