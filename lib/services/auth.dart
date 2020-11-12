import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //sign in anonymous
  Future signInAnon() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//sign in email & password

//register with email & password

//sign out
}
