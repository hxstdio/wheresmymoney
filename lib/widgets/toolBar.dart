import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentDate;
  final double totalCost;
  final double totalIncome;
  final List<String> tabs;
  final double containerHeight = 90.0;
  final double tabBarHeight = 40.0;
  
  ToolBar({
    Key key ,
    @required this.tabs,
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
          // TODO5: move to outer widget
          Row(
            children: [
              Container(
                height: containerHeight,
                padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
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
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'data222222222222222222222222',
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
          TabBar(
            tabs: tabs.map((String name) => Tab(text: name)).toList(),
          ),
        ]
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(containerHeight + tabBarHeight);
  }
}