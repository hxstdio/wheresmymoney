import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/toolBar.dart';
import '../widgets/tabView.dart';
import '../utils/constants.dart' show tabs, appName;

class HomePage extends StatelessWidget {

  // TODO get this data from state
  final int currentDate = 1587474556767;
  final double totalCost = 189.80;
  final double totalIncome = 9999.00;

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
                  bottom: ToolBar(tabs: tabs, currentDate: currentDate, totalCost: totalCost, totalIncome: totalIncome),
                ),
              )
            ];
          },
          body: TabView(tabs: tabs)
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