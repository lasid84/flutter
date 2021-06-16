import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class ProviderFirebaseAuth with ChangeNotifier {
  late final GoogleSignInAccount? googleUser;
  late final GoogleSignInAuthentication googleAuth;
  late final credential;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOutWithGoogle() async {
    FirebaseAuth.instance.signOut();
  }
}
