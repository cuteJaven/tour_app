import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:tour_app/models/user.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(auth.User user) {
    //如果返回不为null（登陆成功），则记录uid
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get userStream {
    return _auth
        .authStateChanges()
        .map((auth.User user) => _userFromFirebaseUser(user));
  }

  //sign in anonymous
  Future signInAnon() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in email & password

//register with email & password

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
