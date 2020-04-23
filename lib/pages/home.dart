import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/toolBar.dart';
import '../widgets/tabView.dart';
import '../utils/constants.dart' show tabs, appName;
import '../models/db.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DataBaseHelper();
  var records = [];
  String totalCost = '0';
  String totalIncome = '0';
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    this._getDataByMonth(this.currentDate);
    super.initState();
  }

  _getDataByMonth(DateTime selectedDate) {
    print('-->start');
    db.getItemByMonth(selectedDate).then((value){
      print('-->done: ${value.length}');
      this._formatRecord(value);
      print(value);
    });
  }

  _formatRecord(List records) {
    double _cost = 0;
    double _income = 0;

    records.forEach((element) {
      print(element['amount']);
      if (element['type'] == 0) {
        _cost += element['amount'];
      } else {
        _income += element['amount'];
      }
    });

    this.setState(() {
      this.totalCost = _cost.toStringAsFixed(2);
      this.totalIncome = _income.toStringAsFixed(2);
    });
  }

  _handleDateSelected(DateTime selectedDate) {
    this.setState(() {
      this.currentDate = selectedDate;
    });

    this._getDataByMonth(selectedDate);
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
          body: TabView()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(
            context, 
            '/add', 
            // arguments: ScreenArguments('From Home', 'Hao')
          );
        },
        child: Icon(Icons.add),
      )
    );
  }
}
