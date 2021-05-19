import 'package:flutter/material.dart';
import 'package:push/ScreenA.dart';
import 'package:push/ScreenB.dart';
import 'ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/a',
      routes: {
        '/a': (context) => ScreenA(),
        '/B': (context) => ScreenB(),
        '/c': (context) => ScreenC(),
      },
    );
  }
}
