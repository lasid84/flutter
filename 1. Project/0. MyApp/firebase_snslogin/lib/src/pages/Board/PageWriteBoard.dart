import 'package:firebase_snslogin/src/Common/Common.dart';
import 'package:firebase_snslogin/src/pages/Board/ModelBoard.dart';
import 'package:flutter/material.dart';

class PageWriteBoard extends StatelessWidget {
  final Board? board;

  PageWriteBoard({Key? key, this.board}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write Board'),
        backgroundColor: Colors.amber[700],
      ),
      body: _screen(context),
    );
  }

  Widget _screen(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: "Title"),
          controller: textEditctl(board?.title),
        ),
        Container(
          child: TextField(
            decoration: InputDecoration(hintText: "Contents"),
            controller: textEditctl(board?.contents),
            maxLines: 50,
          ),
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Row(
          children: [
            textctl(board?.name),
            textctl(
              Common.getDateFormat(
                board?.createdate,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

TextEditingController textEditctl(String? text) {
  if (text == null) {
    return TextEditingController();
  } else {
    return TextEditingController(text: text);
  }
}

Text textctl(String? text) {
  if (text == null) {
    return Text('');
  } else {
    return Text(text);
  }
}
