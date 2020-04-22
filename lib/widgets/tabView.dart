import 'package:flutter/material.dart';
import './recordList.dart';
import './pieChart.dart';

class TabView extends StatelessWidget {
  TabView({Key key}):super(key:key);
  static const double sliverPadding = 0;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        RecordList(),
        RecordPieChart(),
      ]
    );
  }
}