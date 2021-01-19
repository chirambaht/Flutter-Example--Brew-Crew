import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _userFromFirbaseUser(User user) {
    return (user == null) ? null : AppUser(uid: user.uid);
  }

  // Auth change user stream
  Stream<AppUser> get user {
    return _auth
        .authStateChanges()
        // .map((User user) => _userFromFirbaseUser(user));
        .map(_userFromFirbaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirbaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO: Sign in with email and password

  // TODO: Register with email and password

  // TODO: Sign out

}
