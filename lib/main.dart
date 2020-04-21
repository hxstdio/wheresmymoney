import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/addRecord.dart';
import './pages/about.dart';
import './utils/constants.dart' show appName, appBgColor;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Color(appBgColor),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/add': (context) => AddRecord(),
        '/about': (context) => About(),
      },
    );
  }
}
