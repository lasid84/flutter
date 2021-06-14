import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/src/pages/Board/boardModel.dart';
import 'package:firebase_snslogin/src/pages/Board/firebase.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  // final boardRef = FirebaseFirestore.instance.collection(Firebase.com_document_id).withConverter<Board>(
  //   fromFirestore: (snapshot, _) => Board.fromJson(snapshot.data()!),
  //   toFirestore: (board, _) => board.toJson(),
  // );

  final Stream<QuerySnapshot> boardRef = FirebaseFirestore.instance
      .collection(Firebase.com_document_id)
      .orderBy("documentID", descending: true)
      .limit(20)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    print('test0');
    return StreamBuilder<QuerySnapshot>(
      stream: boardRef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          print('test1');
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            print('test123');
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return new ListTile(
              title: Text('test'), //new Text(data['documentID']),
              subtitle: Text('test'), //new Text(data['contents']),
            );
          }).toList(),
        );
      },
    );
  }
}
