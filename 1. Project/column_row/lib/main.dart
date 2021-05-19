import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column&Row',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

// class MyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       // child: Center(
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         // crossAxisAlignment: CrossAxisAlignment.end,
//         // crossAxisAlignment: CrossAxisAlignment.stretch,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             color: Colors.red,
//             child: Text('Container 1'),
//           ),
//           SizedBox(
//             height: 30.0,
//           ),
//           Container(
//             width: 100,
//             height: 100,
//             color: Colors.green,
//             child: Text('Container 2'),
//           ),
//           Container(
//             width: 100,
//             height: 100,
//             color: Colors.blue,
//             child: Text('Container 3'),
//           ),
//           // Container(
//           //   width: double.infinity,
//           //   height: 20,
//           //   child: Text('123'),
//           // ),
//         ],
//       ),
//       // ),
//     ));
//   }
// }

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      // child: Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Text('Container 1'),
          ),
          SizedBox(
            width: 30.0,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: Text('Container 2'),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 20,
          //   child: Text('123'),
          // ),
        ],
      ),
      // ),
    ));
  }
}
