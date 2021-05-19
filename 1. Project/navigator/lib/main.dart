import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      theme: ThemeData(primarySwatch: Colors.red),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to the Second page'),
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (BuildContext ctx) {
            //   return SecondPage();
            // }));
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to the First page'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
