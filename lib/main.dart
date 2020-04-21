import 'package:flutter/material.dart';
import './pages/home.dart';
import './utils/constants.dart' show appName, appBgColor;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Color(appBgColor),
      ),
      home: HomePage(),
    );
  }
}
