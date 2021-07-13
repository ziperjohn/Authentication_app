import 'package:authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _user = UserModel().obs;

  UserModel? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(
        _auth.authStateChanges().map((user) => createCustomUser(user)));
  }

  UserModel createCustomUser(User? user) {
    return UserModel(uid: user?.uid);
  }

  //Sign in anonymously, Firebase create a new user that will be persisted across app restart.
  //If the user signs in anonymously multiple times, they will be signed-in with the initially created account.
  Future<dynamic> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return createCustomUser(userCredential.user);
    } on FirebaseAuthException catch (error) {
      print(error);
      return null;
    }
  }

  //TODO Sign up with  email & password

  //TODO Sign in by email & password

  //TODO Sign out

  void signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (error) {
      print(error);
    }
  }

  //TODO Sign in with  google

  //TODO Sign in with  Facebook

  //TODO Sign in with  Apple
}
