import 'package:flutter/material.dart';
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
                  expandedHeight: 230.0,

                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.person_outline),
                      onPressed: (){
                        print('TODO: jump to about');
                      },
                    )
                  ],

                  bottom: TabBar(
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
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