import 'package:flutter/material.dart';
import './recordList.dart';
import './pieChart.dart';
import '../models/record.dart';

class TabView extends StatelessWidget {
  final List records;

  TabView({Key key, @required this.records}):super(key:key);
  static const double sliverPadding = 0;

  Map<int, List<Map<dynamic, dynamic>>> _formatListData(List records) {
    Map<int, List<Map<dynamic, dynamic>>> dayDatas = {};

    records.forEach((element) {
      var day = DateTime.fromMillisecondsSinceEpoch(element['$columnCreateDate']).day;
      
      if (dayDatas[day] == null) {
        dayDatas[day] = []; 
      }

      dayDatas[day].add(element);
    });

    return dayDatas;
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        RecordList(data: this._formatListData(this.records)),
        RecordPieChart(),
      ]
    );
  }
}