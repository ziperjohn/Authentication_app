import 'package:authentication/models/user_model.dart';
import 'package:authentication/widgets/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    return UserModel(uid: user?.uid, email: user?.email);
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
      // Create custom user
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
        // Create custom user
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
      // Create custom user
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

  //TODO Register app and create SHA1 fingerprint
  //Sign in with google
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Create custom user
      createCustomUser(userCredential.user);
    } on FirebaseAuthException catch (error) {
      showSnackbar(error.code, error.message.toString());
    }
  }

  //TODO Sign in with Facebook

  //TODO Sign in with Apple
}
