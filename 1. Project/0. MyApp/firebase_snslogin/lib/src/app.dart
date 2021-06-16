import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_snslogin/src/pages/Home/PageHome.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Firebase load fail'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return PageHome();
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
