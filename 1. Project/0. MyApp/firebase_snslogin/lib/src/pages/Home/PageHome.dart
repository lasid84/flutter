import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_snslogin/src/pages/Board/PageBoard.dart';
import 'package:firebase_snslogin/src/pages/Login/PageLogin.dart';
import 'package:firebase_snslogin/src/pages/Login/ProviderFirebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rock Paper Scissor(RPS)"),
          backgroundColor: Colors.amber[700],
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
              },
            ),
          ],
        ),
        body: PageMain());
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
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PageBoard()));
                  },
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
            ],
          ),
        );
      }
    },
  );
}
