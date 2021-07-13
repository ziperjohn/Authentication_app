import 'package:authentication/controllers/authentication_controller.dart';
import 'package:authentication/screens/sign_up.dart';
import 'package:authentication/widgets/Button.dart';
import 'package:authentication/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class SignIn extends GetWidget<AuthenticationController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _emailInput(),
            _passwordInput(),
            _signInButton(),
            _signInWithGoogleButton(),
            _loginAnonymouslyButton(),
            _goToSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    return textInput(_emailController, "Email");
  }

  Widget _passwordInput() {
    return textInput(_passwordController, "Password");
  }

  Widget _signInButton() {
    return elevationButton(_signIn, "Sign In");
  }

  Widget _signInWithGoogleButton() {
    return elevationIconButton(
        _signInWithGoogle, "Sign In By Google", Icon(Mdi.google));
  }

  Widget _loginAnonymouslyButton() {
    return elevationButton(_loginAnonymously, "Login Anonymously");
  }

  Widget _goToSignUpButton() {
    return textButton(_goToSignUp, "Sign Up");
  }

  void _signIn() {
    print("Sign in with Email");
  }

  void _signInWithGoogle() {
    print("Sign in with Google");
    print(controller.user?.uid);
  }

  void _loginAnonymously() async {
    var user = await controller.signInAnonymously();
    print(user.uid);
  }

  void _goToSignUp() {
    Get.to(() => SignUp());
  }
}
