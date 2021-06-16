import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/src/pages/Board/ModelBoard.dart';
import 'package:firebase_snslogin/src/pages/Board/DocFirebase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageBoard extends StatefulWidget {
  const PageBoard({Key? key}) : super(key: key);

  @override
  _PageBoardState createState() => _PageBoardState();
}

class _PageBoardState extends State<PageBoard> {
  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
  //     .collection(Firebase.com_document_id)
  //     .orderBy('boardID', descending: true)
  //     .snapshots();
  CollectionReference boardData =
      FirebaseFirestore.instance.collection(Firebase.com_document_id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Text('Board'),
              backgroundColor: Colors.amber[700],
            ),
      body: StreamBuilder<QuerySnapshot>(
        stream: boardData.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
    
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
    
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return SafeArea(
                  child: Card(
                    child: new ListTile(
                      // trailing: Icon(
                      //   Icons.favorite,
                      //   color: Colors.grey,
                      // ),
                      leading: FlutterLogo(
                        size: 36.0,
                      ),
                      title: new Text(
                        data['title'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['contents'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.account_box),                                    
                                    Text(
                                      data['name'],
                                    ),
                                  ],
                                ),
                                Text(
                                  getDateFormat(data['createdate'])!,
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}

String? getDateFormat(String? date) {
  if (date == null) {
    return '-';
  } else {
    String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    final f = new DateFormat('yyyy-MM-dd hh:mm');
    return f.format(dateTime);
  }
}
