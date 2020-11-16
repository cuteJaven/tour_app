import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:tour_app/models/user.dart';
import 'package:tour_app/services/database.dart';

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
    //可以简写成.map(_userFromFirebaseUser)
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
  Future logIndWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
          name: 'new tour member',
          description: 'empty',
          sex: true,
          backUrl:
              'https://tr-osdcp.qunarzz.com/tr-osd-tr-space/img/3390287e7516e496018999e9041cda89.jpg_r_680x466x95_3b7c468c.jpg',
          avatar:
              'https://i.pinimg.com/564x/81/fe/96/81fe96c42cd93466c27aa8b988bd0ff5.jpg',
          followers: 0,
          following: 0);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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
