import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/toolBar.dart';
import '../widgets/tabView.dart';
import '../utils/constants.dart' show tabs, appName;

class HomePage extends StatelessWidget {
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
                        print('TODO: jump to about');
                      },
                    )
                  ],
                  bottom: ToolBar(tabs: tabs, currentDate: null, totalCost: 189.80, totalIncome: 9999.00),
                ),
              )
            ];
          },
          body: TabView(tabs: tabs)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('TODO: go to add record page');
        },
        child: Icon(Icons.add),
      )
    );
  }
}