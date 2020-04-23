import 'package:flutter/material.dart';
import './recordCell.dart';
import './titleCell.dart';

class RecordList extends StatelessWidget {
  final List data;

  RecordList({
    Key key ,
    @required this.data
  }):super(key:key);  

  static const double sliverPadding = 0;

  @override
  Widget build(BuildContext context) {
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

                      // TODO1：真实数据渲染
                      return Column(
                        children: [
                          TitleCell(cost: 10.0, income: 20.0, createDate: 1587445197278),
                          RecordCell(type: 0, subType: 0, name: '拣到的钱1', amount: 20.0),
                          RecordCell(type: 1, subType: 0, name: '拣到的钱2', amount: 20.0),
                          RecordCell(type: 0, subType: 1, name: '拣到的钱', amount: 20.0)
                        ],
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