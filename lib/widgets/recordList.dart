import 'package:flutter/material.dart';
import './recordCell.dart';
import './titleCell.dart';
import '../models/record.dart';

class RecordList extends StatelessWidget {
  final Map<int, List<Map<dynamic, dynamic>>> data;

  RecordList({
    Key key ,
    @required this.data
  }):super(key:key);  

  static const double sliverPadding = 0;

  List _renderList(Map<int, List<Map<dynamic, dynamic>>> data) {
    List<Widget> widgets = [];
    data.forEach((int key, List<Map<dynamic, dynamic>> value) {
      double cost = 0;
      double income = 0;
      int createDate = value[0]['$columnCreateDate'];
      List<Widget> subWidgets = [];

      value.forEach((element) {
        if (element['$columnType'] == 0) {
          cost += element['$columnAmount'];
        } else {
          income += element['$columnAmount'];
        }
        subWidgets.add(RecordCell(type: element['$columnType'], subType: element['$columnSubType'], name: element['$columnName'], amount: element['$columnAmount']));
      });
      widgets.add(TitleCell(cost: cost, income: income, createDate: createDate));
      widgets.addAll(subWidgets);
    });

    if (widgets.length == 0){
      widgets.add(Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Text('本月暂无纪录哦'),
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // print('recordList --->');
    // print(data);
    List<Widget> widgets = this._renderList(data);

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
                padding: const EdgeInsets.all(sliverPadding),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: widgets,
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