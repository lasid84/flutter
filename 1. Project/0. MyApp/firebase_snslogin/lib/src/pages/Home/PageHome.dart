import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_snslogin/src/pages/Board/PageBoard.dart';
import 'package:firebase_snslogin/src/pages/Login/PageLogin.dart';
import 'package:firebase_snslogin/src/pages/Login/ProviderFirebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // FirebaseAuth.instance.signOut();
        // return true;
        return _onBackPressed();
      },
      child: Scaffold(
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
          body: PageMain()),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Do you want to sign out?'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  FirebaseAuth.instance.signOut();
                },
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
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
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 300,
                width: 400,
                child: Image.asset('assets/images/mainimage.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Vs.Player(Rock Paper Scissors)',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Vs.Player(Remove one(RPS)',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Vs.Computer(Rock Paper Scissors)',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PageBoard()));
                  },
                  child: Text(
                    'Board',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
