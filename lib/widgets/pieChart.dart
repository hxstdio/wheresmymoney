import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/constants.dart' show costIconMapping;
import '../models/record.dart';

class RecordPieChart extends StatefulWidget{
  final Map<int, List<Map<dynamic, dynamic>>> data;
  RecordPieChart({
    Key key ,
    @required this.data,
  }):super(key:key);

  @override
  _RecordPieChart createState() => _RecordPieChart();
}

class _RecordPieChart extends State<RecordPieChart>{
  int touchedIndex;

  List<PieChartSectionData> _renderPieChart(Map<int, List<Map<dynamic, dynamic>>> data) {
    List<PieChartSectionData> sectionList = [];

    final isTouched = false; // TODO2:  i == this.touchedIndex;
    final double fontSize = isTouched ? 25 : 16;
    final double radius = isTouched ? 60 : 50;

    data.forEach((int key, List<Map<dynamic, dynamic>> value) {
      double cost = 0;
      
      value.forEach((element) {
        cost += element['$columnAmount'];
      });

      sectionList.add(PieChartSectionData(
        color: Color(costIconMapping[key]['color']),
        value: cost,
        title: costIconMapping[key]['name'],
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
      ));
    });

    return sectionList;
  }

  @override
  Widget build(BuildContext context) {  
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>('1'),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                  if(pieTouchResponse.touchInput is FlPanStart) {
                                    this.setState(() {
                                      this.touchedIndex = pieTouchResponse.touchedSectionIndex;
                                    });
                                  }
                                }),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                                sections: this._renderPieChart(widget.data)
                              ),
                            )
                          ),
                          Text('111')
                        ],
                      );
                    },
                    childCount: 1, 
                  ), 
                ),
              )
            ],
          );
        },
      ),
    );
  }  
}