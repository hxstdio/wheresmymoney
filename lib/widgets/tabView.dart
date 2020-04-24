import 'package:flutter/material.dart';
import './recordList.dart';
import './pieChart.dart';
import '../models/record.dart';
import '../models/enums.dart';

class TabView extends StatelessWidget {
  final List records;

  TabView({Key key, @required this.records}):super(key:key);
  static const double sliverPadding = 0;

  Map<int, List<Map<dynamic, dynamic>>> _formatListData(List records) {
    Map<int, List<Map<dynamic, dynamic>>> dayDatas = {};

    records.forEach((element) {
      int day = DateTime.fromMillisecondsSinceEpoch(element['$columnCreateDate']).day;
      
      if (dayDatas[day] == null) {
        dayDatas[day] = []; 
      }

      dayDatas[day].add(element);
    });

    return dayDatas;
  }

  Map<int, List<Map<dynamic, dynamic>>> _formatChartData(List records) {
    Map<int, List<Map<dynamic, dynamic>>> typeDatas = {};

    records.forEach((element) {      
      if(element['$columnType'] == RecordType.cost.index) {
        int subType = element['$columnSubType'];
      
        if (typeDatas[subType] == null) {
          typeDatas[subType] = []; 
        }

        typeDatas[subType].add(element);
      }
    });

    return typeDatas;
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        RecordList(data: this._formatListData(this.records)),
        RecordPieChart(data: this._formatChartData(this.records)),
      ]
    );
  }
}