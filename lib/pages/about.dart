import 'package:flutter/material.dart';
import '../models/db.dart';

class About extends StatelessWidget {
  final db = DataBaseHelper();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
            RaisedButton(
              onPressed: () {
                db.clear().then((value) {
                  Navigator.pop(context);
                });
              },
              child: Text('Clear db'),
            ),
            RaisedButton(
              onPressed: () {
                db.getTotalList().then((value) {
                  print('-->');
                  value.forEach((element) {
                    var createDate = element['createDate'];
                    var dd = DateTime.fromMillisecondsSinceEpoch(createDate);
                    print('${dd.year}-${dd.month}-${dd.day}: $element');
                  });
                });
              },
              child: Text('select all'),
            ),
            RaisedButton(
              onPressed: () {
                db.getItemByMs(1585756800000).then((value) {
                  print('-->');
                  print(value);

                  value.forEach((element) {
                    var createDate = element['createDate'];
                    var dd = DateTime.fromMillisecondsSinceEpoch(createDate);
                    print('${dd.year} - ${dd.month} - ${dd.day}');
                  });
                });
              },
              child: Text('select by day'),
            ),
            RaisedButton(
              onPressed: () {
                db.getItemByTest().then((value) {
                  print('-->');
                  print(value);

                  value.forEach((element) {
                    var createDate = element['createDate'];
                    var dd = DateTime.fromMillisecondsSinceEpoch(createDate);
                    print('${dd.year} - ${dd.month} - ${dd.day}');
                  });
                });
              },
              child: Text('select by test'),
            ),
          ]
        )
      )
    );
  }
}