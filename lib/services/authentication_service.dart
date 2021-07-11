import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in anonymously, Firebase create a new user that will be persisted across app restart.
  //If the user signs in anonymously multiple times, they will be signed-in with the initially created account.
  Future<dynamic> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential;
    } on FirebaseAuthException catch (error) {
      print(error);
      return null;
    }
  }

  //TODO Sign up with  email & password

  //TODO Sign in by email & password

  //TODO Sign out

  //TODO Sign in with  google

  //TODO Sign in with  Facebook

  //TODO Sign in with  Apple
}
