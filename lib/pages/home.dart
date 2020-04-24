import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/toolBar.dart';
import '../widgets/tabView.dart';
import '../utils/constants.dart' show tabs, appName;
import '../models/db.dart';
import '../models/record.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DataBaseHelper();
  var listData = [];
  String totalCost = '0';
  String totalIncome = '0';
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    this._getDataByMonth(this.currentDate);
    super.initState();
  }

  _getDataByMonth(DateTime selectedDate) {
    db.getItemByMonth(selectedDate).then((value){
      this._formatRecord(value);
    });
  }

  _formatRecord(List records) {
    double _cost = 0;
    double _income = 0;

    records.forEach((element) {
      if (element['$columnType'] == 0) {
        _cost += element['$columnAmount'];
      } else {
        _income += element['$columnAmount'];
      }
    });

    this.setState(() {
      this.totalCost = _cost.toStringAsFixed(2);
      this.totalIncome = _income.toStringAsFixed(2);
      this.listData = records;
    });
  }

  _handleDateSelected(DateTime selectedDate) {
    this.setState(() {
      this.currentDate = selectedDate;
    });

    this._getDataByMonth(selectedDate);
  }

  _navigateAndRefresh(BuildContext context) async {
    final isRefresh = await Navigator.pushNamed(
      context, 
      '/add', 
    );

    if(isRefresh) {
      this._getDataByMonth(this.currentDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  title: Text(appName),
                  centerTitle: false,
                  pinned: true,
                  floating: false,
                  snap: false,
                  primary: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.person_outline),
                      onPressed: (){
                        Navigator.pushNamed(
                          context, 
                          '/about', 
                          // arguments: ScreenArguments('From Home', 'Hao')
                        );
                      },
                    )
                  ],
                  bottom: ToolBar(
                    tabs: tabs, 
                    currentDate: currentDate, 
                    totalCost: totalCost, 
                    totalIncome: totalIncome,
                    onDateSelected: _handleDateSelected,
                  ),
                ),
              )
            ];
          },
          body: TabView(records: this.listData,)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _navigateAndRefresh(context);
        },
        child: Icon(Icons.add),
      )
    );
  }
}
