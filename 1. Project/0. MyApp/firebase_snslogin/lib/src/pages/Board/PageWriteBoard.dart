
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_snslogin/src/Common/Common.dart';
import 'package:firebase_snslogin/src/pages/Board/DocFirebase.dart';
import 'package:firebase_snslogin/src/pages/Board/ModelBoard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

class PageWriteBoard extends StatefulWidget {
  final Board? board;

  PageWriteBoard({Key? key, this.board}) : super(key: key);
  

  @override
  _PageWriteBoardState createState() => _PageWriteBoardState();
}

class _PageWriteBoardState extends State<PageWriteBoard> {
  late final TextEditingController tectitle;
  late final TextEditingController teccontents;
  late bool _showIcon, _updateFlag;

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

    if (widget.board?.email == null) {
      _showIcon = true;
    } else {
      _showIcon = widget.board?.email == Common.email ? true : false;
    }

    if(widget.board == null) {
      _updateFlag = false;
    } else {
      _updateFlag = true;
    }
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
                String date = DateFormat("yyyyMMddhhmmss").format(await NTP.now());

                if (_updateFlag == false) {
                  AddBoard(
                      '1',
                      Common.email,
                      Common.name,
                      Common.nickName,
                      tectitle.text,
                      teccontents.text,
                      date).writeBoard();
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
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Title"),
              controller: tectitle,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Contents"),
                controller: teccontents,
                maxLines: 50,
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
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
