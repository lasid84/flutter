import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/src/pages/Board/boardModel.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {

  final moviesRef = FirebaseFirestore.instance.collection('RPS_BOARD').withConverter<Board>(
    fromFirestore: (snapshot, _) => Board.fromJson(snapshot.data()!),
    toFirestore: (movie, _) => movie.toJson(),
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
