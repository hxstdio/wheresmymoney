import 'package:flutter/material.dart';
import './recordList.dart';
import './pieChart.dart';

class TabView extends StatelessWidget {
  final List records;

  TabView({Key key, @required this.records}):super(key:key);
  static const double sliverPadding = 0;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        RecordList(data: records),
        RecordPieChart(),
      ]
    );
  }
}