import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_snslogin/src/Common/Common.dart';
import 'package:firebase_snslogin/src/DataBase/TablePersonalInfo.dart';
import 'package:firebase_snslogin/src/DataBase/database.dart';
import 'package:firebase_snslogin/src/myButton/MainMenuButton.dart';
import 'package:firebase_snslogin/src/pages/Board/PageBoard.dart';
import 'package:firebase_snslogin/src/pages/Login/PageLogin.dart';
import 'package:firebase_snslogin/src/pages/Login/ProviderFirebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(!GetIt.instance.isRegistered<DBDao>()) {
      final db = Database();

      GetIt.instance.registerSingleton<DBDao>(DBDao(db));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rock Paper Scissor(RPS)"),
        backgroundColor: Colors.amber[700],
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          PopupMenuButton(
              child: Icon(Icons.menu),
              onSelected: menuAction,
              itemBuilder: (BuildContext itemBuilder) => {'Sign Out'}
                  .map((value) => PopupMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList())
        ],
      ),
      body: PageMain(),
    );
  }
}

void menuAction(String value) {
  switch (value) {
    case 'Opt 1':
      break;
    case 'Sign Out':
      FirebaseAuth.instance.signOut();
      break;
  }
}

Widget PageMain() {
  var btnMenu = new MainMenuButton();

  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
      if (!snapshot.hasData) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => ProviderFirebaseAuth()),
          ],
          child: PageLogin(),
        );
      } else {
        Common.nickName = snapshot.data!.displayName.toString();
        Common.name = snapshot.data!.displayName.toString();
        Common.email = snapshot.data!.email.toString();
        return WillPopScope(
          //이건 물어보고 종료하는 법
          onWillPop: () async => await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Do you want to sign out? '),
              actions: [
                RaisedButton(
                    child: Text('Yes'),
                    onPressed: () => {
                          Navigator.of(context).pop(false),
                          FirebaseAuth.instance.signOut(),
                        }),
                RaisedButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
          ),
          //뒤로가기 누르면 스낵바 띄우고 1초안에 한번더 뒤로가기누름 종료
          //기능 안됨, 더 연구중
          // late DateTime? _lastQuitTime;
          // return WillPopScope(
          //   onWillPop: () async {
          //     if (_lastQuitTime == null) {
          //       Scaffold.of(context).showSnackBar(
          //           SnackBar(content: Text('press back button again ')));
          //       _lastQuitTime = DateTime.now();
          //       return false;
          //     } else if (_lastQuitTime != null &&
          //         DateTime.now().difference(_lastQuitTime!).inSeconds > 1) {
          //       Scaffold.of(context).showSnackBar(
          //           SnackBar(content: Text('press back button again ')));
          //       _lastQuitTime = DateTime.now();
          //       return false;
          //     } else {
          //       Navigator.of(context).pop(true);
          //       return true;
          //     }
          //   },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 - 30,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/RPS_MAIN.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),

                  // child: TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'Play RPS',
                  //     style: TextStyle(color: Colors.white, fontSize: 15.0),
                  //   ),
                  //   style: ButtonStyle(
                  //     backgroundColor:
                  //         MaterialStateProperty.all<Color>(Colors.grey),
                  //   ),
                  // ),
                  child: btnMenu.renderTextBtn(
                    'Play RPS',
                    () => {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  // child: TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'Play RPS Remove one',
                  //     style: TextStyle(color: Colors.white, fontSize: 15.0),
                  //   ),
                  //   style: ButtonStyle(
                  //     backgroundColor:
                  //         MaterialStateProperty.all<Color>(Colors.grey),
                  //   ),
                  // ),
                  child: btnMenu.renderOutlinedBtn(
                    'Play RPS Remove one',
                    () => {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  // child: TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'Infinity Challenge',
                  //     style: TextStyle(color: Colors.white, fontSize: 15.0),
                  //   ),
                  //   style: ButtonStyle(
                  //     backgroundColor:
                  //         MaterialStateProperty.all<Color>(Colors.grey),
                  //   ),
                  // ),
                  child: btnMenu.renderElevatedBtn(
                    'Infinity Challenge',
                    () => {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PageBoard()));
                    },
                    child: Text(
                      'Board',
                      // style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    // style: ButtonStyle(
                    //   backgroundColor:
                    //       MaterialStateProperty.all<Color>(Colors.grey),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    },
  );
}
