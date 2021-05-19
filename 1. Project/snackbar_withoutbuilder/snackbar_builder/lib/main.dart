import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
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
        title: Text('Snack Bar'),
        centerTitle: true,
      ),
      // body: MySnackBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            flutterToast();
          },
          child: Text('Toast'),

          // color: Colors.blue,
          // textColor: Colors.white,
        ),
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: 'Flutter123',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      toastLength: Toast.LENGTH_LONG);
}

// class MySnackBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       // ignore: deprecated_member_use
//       child: RaisedButton(
//         child: Text('Show me'),
//         onPressed: () {
//           // ignore: deprecated_member_use
//           Scaffold.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 'Hello',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Colors.teal,
//               duration: Duration(milliseconds: 1000),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
