import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/src/pages/Board/DocFirebase.dart';
import 'package:flutter/material.dart';

class AjaxProvider extends ChangeNotifier {
  final CollectionReference boardData =
      FirebaseFirestore.instance.collection(Firebase.com_document_id);
}
