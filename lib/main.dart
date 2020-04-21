import 'package:flutter/material.dart';
import './pages/home.dart';
import './utils/constants.dart' show appName;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Color(0xff8891A0), // TODO
        primaryColorDark: Color(0xff388E3C), // TODO
      ),
      home: HomePage(),
    );
  }
}
