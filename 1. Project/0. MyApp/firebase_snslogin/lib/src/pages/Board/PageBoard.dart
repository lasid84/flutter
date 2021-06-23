import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/src/Common/Common.dart';
import 'package:firebase_snslogin/src/pages/Board/ModelBoard.dart';
import 'package:firebase_snslogin/src/pages/Board/DocFirebase.dart';
import 'package:firebase_snslogin/src/pages/Board/PageWriteBoard.dart';
import 'package:flutter/material.dart';

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
  Query<Map<String, dynamic>> boardData =
      FirebaseFirestore.instance.collection(DocFirebase.com_document_id)
      .where('boardID', isEqualTo: DocFirebase.com_normal_boardID)
      .orderBy('createdate', descending: true)
      ;

  // Query<Map<String, dynamic>> boardNotice =
  // FirebaseFirestore.instance.collection(DocFirebase.com_document_id)
  //     .where('boardID', isEqualTo: DocFirebase.com_notice_boardID)
  //     .orderBy('createdate', descending: true)
  // ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Developer'),
        backgroundColor: Colors.amber[700],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: boardData.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;

                  Board board = Board.fromJson(data);

                  return _screenBoard(data, board);
                }).toList(),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageWriteBoard(board: null),
              ));
        },
        tooltip: 'Write Board',
        child: Icon(Icons.add),
        backgroundColor: Colors.amber[700],
      ), // This trailing comma
    );
  }

  Widget _screenBoard(var data, var board) {
    return SafeArea(
      child: Card(
        child: new ListTile(
          // trailing: Icon(
          //   Icons.favorite,
          //   color: Colors.grey,
          // ),
          // leading: FlutterLogo(
          //   size: 36.0,
          // ),
          leading: Icon(Icons.question_answer_outlined , size: 50.0,),
          title: Text(
            data['title'],
            style: TextStyle(fontSize: 20.0),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
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
                      Common.getDateFormat(data['createdate']),
                    ),
                  ]),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageWriteBoard(board: board),
              ),
            );
          },
        ),
      ),
    );
  }


}
