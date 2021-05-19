import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
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
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     print('menu button is clicked.');
        //   },
        // ),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('INSAM.jpg'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('pngwing.png'),
                  backgroundColor: Colors.white,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('pngwing.png'),
                //   backgroundColor: Colors.white,
                // ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('pngwing.png'),
                //   backgroundColor: Colors.white,
                // ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('pngwing.png'),
                //   backgroundColor: Colors.white,
                // ),
              ],
              accountName: Text('인삼'),
              accountEmail: Text('Lasid84@gmail.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(40.0),
                    // bottomRight: Radius.circular(40.0),
                    ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Setting'),
              onTap: () {
                print('Setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Question'),
              onTap: () {
                print('Question is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
