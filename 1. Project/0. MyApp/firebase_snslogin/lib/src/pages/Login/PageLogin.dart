import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_snslogin/src/myButton/googleLoginBtn.dart';
import 'package:firebase_snslogin/src/pages/Login/ProviderFirebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatelessWidget {
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  late final ProviderFirebaseAuth _auth;

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<ProviderFirebaseAuth>(context, listen: false);
    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
        // appBar: AppBar(
        //   // title: const Text('Login'),
        //   // backgroundColor: Colors.amber[700],
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/INSAM_GIF.gif'),
                  radius: 150.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                child: Divider(
                  height: 60.0,
                  color: Colors.grey[850],
                  thickness: 0.5,
                  endIndent: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GoogleLoginButton(
                  image: Image.asset(
                    'assets/images/glogo.png',
                    scale: 2.5,
                    fit: BoxFit.cover,
                  ),
                  text: const Text(
                    'Login with Google',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  buttonstyle: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  radius: 4.0,
                  onPressed: _auth.signInWithGoogle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
