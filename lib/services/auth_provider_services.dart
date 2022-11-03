import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthProviderService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;
  AuthProviderService._();

  static AuthProviderService instance = AuthProviderService._();

  Future<void> signIn() async {
    GoogleSignInAccount? signInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? authentication =
        await signInAccount?.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: authentication?.idToken,
      accessToken: authentication?.accessToken,
    );

    await _auth.signInWithCredential(authCredential);
    isLoading = false;
  }

  Future<void> signOut() async {
    if (user != null) {
      await _auth.signOut();
    }
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    isLoading = false;
  }

  User? get user => _auth.currentUser;

  loading() {
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
