import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_snslogin/src/pages/Board/boardPage.dart';
import 'package:firebase_snslogin/src/pages/Login/login.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              //print('shopping_Cart button is clicked.');
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return const LoginWidget();
          } else {
            print('test-1');
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BoardPage()));
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
      ),
    );
  }
}
