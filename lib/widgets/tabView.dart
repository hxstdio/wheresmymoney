import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/recordCell.dart';
import './titleCell.dart';

class TabView extends StatelessWidget {
  final List<String> tabs;
  TabView({Key key ,@required this.tabs}):super(key:key);

  static const double sliverPadding = 0;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
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
                    padding: const EdgeInsets.all(sliverPadding),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {

                          // TODO1：真实数据渲染
                          return Column(
                            children: [
                              TitleCell(cost: 10.0, income: 20.0, createDate: 1587445197278),
                              RecordCell(type: 0, subType: 0, name: '拣到的钱', amount: 20.0),
                              RecordCell(type: 1, subType: 0, name: '拣到的钱', amount: 20.0),
                              RecordCell(type: 0, subType: 1, name: '拣到的钱', amount: 20.0)
                            ],
                          );
                        },

                        // TODO2: should use length of the data
                        childCount: 10, 
                      ), 
                    ),
                  )
                ],
              );
            },
          ),
        );
      }).toList()
    );
  }
}