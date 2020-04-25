import 'package:flutter/material.dart';
import './recordCell.dart';
import './titleCell.dart';
import '../models/record.dart';
import '../utils/constants.dart' show noResult, noMore;

class RecordList extends StatefulWidget {
  final Map<int, List<Map<dynamic, dynamic>>> data;
  
  RecordList({
    Key key ,
    @required this.data
  }):super(key:key);  

  @override
  _RecordList createState() => _RecordList();
}

class _RecordList extends State<RecordList>{
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  
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
      widgets.add(_renderNoResult('$noResult'));
    } else {
      widgets.add(_renderNoResult('$noMore'));
    }

    return widgets;
  }

  Widget _renderNoResult(String desc) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 50.0, 0, 50.0),
      child: Center(
        child: Text('$desc'),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = this._renderList(widget.data);

    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  widgets
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}