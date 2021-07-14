import 'package:authentication/models/user_model.dart';
import 'package:authentication/widgets/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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

  // passwords validation
  bool _passwordsValidation(String password, String confirmPassword) {
    return password == confirmPassword ? true : false;
  }

  //Sign in anonymously, Firebase create a new user that will be persisted across app restart.
  //If the user signs in anonymously multiple times, they will be signed-in with the initially created account.
  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      createCustomUser(userCredential.user);
    } on FirebaseAuthException catch (error) {
      showSnackbar(error.code, error.message.toString());
    }
  }

  //Sign up with email & password
  Future<void> signUp(
      String email, String password, String confirmPassword) async {
    if (_passwordsValidation(password, confirmPassword)) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        createCustomUser(userCredential.user);
        Get.back();
      } on FirebaseAuthException catch (error) {
        showSnackbar(error.code, error.message.toString());
      }
    } else {
      showSnackbar("Error", "Passwords don't match");
    }
  }

  //Sign in with email & password
  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      createCustomUser(userCredential.user);
    } on FirebaseAuthException catch (error) {
      showSnackbar(error.code, error.message.toString());
    }
  }

  //Sing out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (error) {
      showSnackbar(error.code, error.message.toString());
    }
  }

  //TODO Sign in with google

  //TODO Sign in with Facebook

  //TODO Sign in with Apple
}
