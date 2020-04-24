import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/summaryCell.dart';
import '../utils/constants.dart' show tabBarBgColor;

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final DateTime currentDate;
  final String totalCost;
  final String totalIncome;
  final List<String> tabs;
  final double containerHeight = 90.0;
  final double tabBarHeight = 40.0;
  final onDateSelected;
  
  ToolBar({
    Key key ,
    @required this.tabs,
    @required this.currentDate,
    @required this.totalCost,
    @required this.totalIncome,
    @required this.onDateSelected,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {  
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SummaryCell(
            cellHeight: containerHeight, 
            selectedDate: currentDate,
            totalIncome: totalIncome,
            totalCost: totalCost,
            onDateSelected: onDateSelected,
          ),
          Material(
            color: Color(tabBarBgColor),
            child: TabBar(
              labelStyle: TextStyle(
                fontSize: 16
              ),
              indicatorWeight: 3.0,
              labelColor: Colors.white,
              tabs: tabs.map((String name) => Tab(text: name)).toList(),
            ),
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