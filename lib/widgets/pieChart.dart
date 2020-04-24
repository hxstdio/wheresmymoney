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
  Map typeMapIndex;

  @override
  void initState() {
    this.touchedIndex = 0;
    this.typeMapIndex = {};
    super.initState();
  }
  
  List<PieChartSectionData> _renderPieChart(Map<int, List<Map<dynamic, dynamic>>> data) {
    List<PieChartSectionData> sectionList = [];
    int indexTag = 0;

    data.forEach((int key, List<Map<dynamic, dynamic>> value) {
      double cost = 0;
      
      value.forEach((element) {
        cost += element['$columnAmount'];
      });

      sectionList.add(PieChartSectionData(
        color: Color(costIconMapping[key]['color']),
        value: cost,
        title: costIconMapping[key]['name'],
        radius: indexTag == this.touchedIndex ? 60 : 50,
        titleStyle: TextStyle(
          fontSize: indexTag == this.touchedIndex ? 25 : 16,
          fontWeight: FontWeight.bold, 
          color: const Color(0xffffffff)
        ),
      ));

      indexTag++;
    });

    return sectionList;
  }

  Widget _renderList(Map<int, List<Map<dynamic, dynamic>>> data) {
    int selectedType = data.keys.toList()[this.touchedIndex];
    List typeData = data[selectedType];

    if(typeData.length == 0) {
      return Text('暂时没有类别详情');
    }

    double cost = 0;
    List<Widget> itemList = [];
    DateTime theUsedDay;
    typeData.forEach((element) {
      cost += element['$columnAmount'];
      theUsedDay = DateTime.fromMillisecondsSinceEpoch(element['$columnCreateDate']);

      itemList.add(Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xFFE1E1E6))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    '${theUsedDay.month}月${theUsedDay.day}日' + '   ' + element['$columnName'],
                    style: TextStyle(
                      color: Colors.grey
                    )
                  ),
                ]
              )
            ),
            Text(element['$columnAmount'].toString(), style: TextStyle(
              color: Colors.grey
            ),)
          ],
        ),   
      ));
    });

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Color(0xFFE1E1E6)))
          ),
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment(0, 0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(costIconMapping[selectedType]['color']),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Icon(costIconMapping[selectedType]['icon'], color: Colors.white,),
                    ),
                    Text(
                      costIconMapping[selectedType]['name'], 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ]
                )
              ),
              Text('$cost', style: TextStyle(
                color: Colors.grey
              ),)
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xfff2f3f4)
          ),
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            children: itemList,
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {  
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>('pieChart'),
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
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                  if(pieTouchResponse.touchInput is FlPanStart && pieTouchResponse.touchedSectionIndex != null) {
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
                          this._renderList(widget.data)
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