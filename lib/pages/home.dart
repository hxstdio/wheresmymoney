import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/toolBar.dart';
import '../widgets/tabView.dart';
import '../widgets/summaryCell.dart';
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

                  // TODO4: real data
                  // flexibleSpace: SummaryCell(currentDate: 1587445197278, totalCost: 129.34, totalIncome: 3400.00,),
                  
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.person_outline),
                      onPressed: (){
                        print('TODO: jump to about');
                      },
                    )
                  ],

                  bottom: ToolBar(tabs: tabs, currentDate: null, totalCost: null, totalIncome: null),
                  // bottom: TabBar(
                  //   tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  // ),
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