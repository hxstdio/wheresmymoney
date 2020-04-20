import 'package:flutter/material.dart';
import '../utils/constants.dart';

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
          body: TabBarView(
            children: tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 50.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Hao $index'),
                                );
                              },
                              childCount: 30,
                            ), 
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
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