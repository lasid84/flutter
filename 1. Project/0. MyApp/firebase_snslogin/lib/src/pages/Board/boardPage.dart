import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/src/pages/Board/boardModel.dart';
import 'package:firebase_snslogin/src/pages/Board/firebase.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection(Firebase.com_document_id)
      .orderBy('boardID', descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          body: new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Card(
                child: new ListTile(
                  // trailing: Icon(
                  //   Icons.favorite,
                  //   color: Colors.grey,
                  // ),
                  leading: FlutterLogo(
                    size: 56.0,
                  ),
                  title: new Text(
                    data['title'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        data['contents'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
