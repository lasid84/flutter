import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_snslogin/src/pages/login.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return const LoginWidget();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${snapshot.data!.displayName}님 환영합니다.'),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                      ),
                      child: const Text(
                        'Google Logout',
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      }),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
