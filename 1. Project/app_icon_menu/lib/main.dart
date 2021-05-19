import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appbar',
      theme: ThemeData (
        primarySwatch: Colors.red
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.menu), 
          onPressed: () {  
            print('menu button is clicked.');
          },
        ),
        actions: [
           IconButton(
          icon: Icon(Icons.shopping_cart), 
          onPressed: () {  
            print('shopping_Cart button is clicked.');
          },
        ),
         IconButton(
          icon: Icon(Icons.search), 
          onPressed: () {  
            print('Search button is clicked.');
          },
        ),
        ],
      ),      
    );
  }   
}