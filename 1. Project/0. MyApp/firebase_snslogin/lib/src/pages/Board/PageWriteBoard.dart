import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/main.dart';
import 'package:firebase_snslogin/src/Common/Common.dart';
import 'package:firebase_snslogin/src/pages/Board/DocFirebase.dart';
import 'package:firebase_snslogin/src/pages/Board/ModelBoard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

//To do
//1. Form 위젯사용하여 validation 구현

class PageWriteBoard extends StatefulWidget {
  final Board? board;
  final String? id;

  PageWriteBoard({Key? key, this.board, this.id}) : super(key: key);

  @override
  _PageWriteBoardState createState() => _PageWriteBoardState();
}

class _PageWriteBoardState extends State<PageWriteBoard> {
  late final TextEditingController tectitle;
  late final TextEditingController teccontents;
  late bool _showIcon, _updateFlag;
  late bool _readonly;

  @override
  void dispose() {
    super.dispose();
    tectitle.dispose();
    teccontents.dispose();
  }

  @override
  void initState() {
    super.initState();
    tectitle = TextEditingController(
        text: widget.board?.title == null ? '' : widget.board?.title);
    teccontents = TextEditingController(
        text: widget.board?.contents == null ? '' : widget.board?.contents);

    if (widget.id == null) {
      _showIcon = true;
      _readonly = false;
    } else {
      _showIcon = widget.board?.email == Common.email ? true : false;
      _readonly = widget.board?.email == Common.email ? false : true;
    }

    if (widget.id == null) {
      _updateFlag = false;
    } else {
      _updateFlag = true;
    }

    // GetComment _getComment = GetComment(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write Board'),
        backgroundColor: Colors.amber[700],
        actions: [
          Visibility(
            child: IconButton(
              onPressed: () async {
                //String date = DateFormat("yyyyMMddhhmmss").format(DateTime.now());
                String date =
                    DateFormat("yyyyMMddhhmmss").format(await NTP.now());

                if (_updateFlag == false) {
                  AddBoard('1', Common.email, Common.name, Common.nickName,
                          tectitle.text, teccontents.text, date)
                      .writeBoard();
                } else {
                  UpdateBoard(
                          widget.id!,
                          '1',
                          Common.email,
                          Common.name,
                          Common.nickName,
                          tectitle.text,
                          teccontents.text,
                          date)
                      .updateBoard();
                }

                Navigator.of(context).pop(true);
              },
              icon: Icon(
                Icons.save_alt_sharp,
              ),
            ),
            visible: _showIcon,
          ),
        ],
      ),
      body: _screen(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _screen(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Title"),
              controller: tectitle,
              //enableInteractiveSelection: _updateFlag,
              readOnly: _readonly,
              showCursor: !_readonly,
              // onTap: () {
              //   if (_readonly)
              //     Focus.of(context).unfocus();
              // },
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Contents"),
                controller: teccontents,
                maxLines: 50,
                //enableInteractiveSelection: _updateFlag,
                readOnly: _readonly,
                showCursor: !_readonly,
                // onTap: () {
                //   if (_readonly)
                //     Focus.of(context).unfocus();
                // },
              ),
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textctl(widget.board?.name),
                textctl(
                  Common.getDateFormat(
                    widget.board?.createdate,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(thickness: 2.0, color: Colors.black,),
            GetComment(widget.id.toString()),
          ],
        ),
      ),
    );
  }
}

TextEditingController textEditctl(String? text) {
  if (text == null) {
    return TextEditingController(text: text == null ? '' : '1');
  } else {
    return TextEditingController(text: text);
  }
}

Text textctl(String? text) {
  if (text == null) {
    return Text(Common.nickName);
  } else {
    return Text(text);
  }
}

class AddBoard {
  final String boardID;
  final String email;
  final String name;
  final String? nickname;
  final String title;
  final String? contents;
  final String? createdate;

  AddBoard(this.boardID, this.email, this.name, this.nickname, this.title,
      this.contents, this.createdate);

  CollectionReference boardData =
      FirebaseFirestore.instance.collection(DocFirebase.com_document_id);

  Future<void> writeBoard() {
    return boardData
        .add({
          'documentID': boardData.id,
          'boardID': DocFirebase.com_normal_boardID,
          'email': email,
          'name': name,
          'nickname': nickname,
          'title': title,
          'contents': contents,
          'createdate': createdate,
        })
        .then((value) => print("Board Added"))
        .catchError((error) => print("Failed to add board: $error"));
  }
}

class UpdateBoard {
  final String id;
  final String boardID;
  final String email;
  final String name;
  final String? nickname;
  final String title;
  final String? contents;
  final String? createdate;

  UpdateBoard(this.id, this.boardID, this.email, this.name, this.nickname,
      this.title, this.contents, this.createdate);

  CollectionReference boardData =
      FirebaseFirestore.instance.collection(DocFirebase.com_document_id);

  Future<void> updateBoard() {
    return boardData
        .doc(id)
        .update({
          // 'documentID': boardData.id,
          // 'boardID': boardID,
          // 'email': email,
          // 'name': name,
          // 'nickname': nickname,
          'title': title,
          'contents': contents,
          // 'createdate': createdate,
        })
        .then((value) => print("updated Board"))
        .catchError((error) => print("Failed to update board: $error"));
  }
}

class GetComment extends StatelessWidget {
  final String documentId;

  GetComment(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference comments =
        FirebaseFirestore.instance.collection(DocFirebase.com_comment_id);

    return FutureBuilder<QuerySnapshot>(
      future: comments.where('DOCID', isEqualTo: documentId.toString()).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          // Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
          // return Text("↳ : ${data['COMMENT']}");

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    BoardComment comment = BoardComment.fromJson(data);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("↳ ${comment.comment}"),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10.0,),
                                Icon(Icons.account_circle_outlined),
                                Text("${comment.name}"),
                              ],
                            ),
                            Text(Common.getDateFormat(comment.createdate.toString())),
                          ],
                        ),
                        Divider(thickness: 1.0, color: Colors.black12,),
                        SizedBox(
                          height: 10.0,
                        ),

                      ],
                    );
                  }).toList(),
                ),
              ),
          );
        }

        return Text("loading");
      },
    );
  }
}
