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
          ]
        )
      )
    );
  }
}