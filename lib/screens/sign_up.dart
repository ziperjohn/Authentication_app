import 'package:authentication/controllers/authentication_controller.dart';
import 'package:authentication/widgets/Buttons.dart';
import 'package:authentication/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends GetWidget<AuthenticationController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _emailInput(),
            _passwordInput(),
            _confirmPasswordInput(),
            _signUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    return textInput(_emailController, "Email", false);
  }

  Widget _passwordInput() {
    return textInput(_passwordController, "Password", true);
  }

  Widget _confirmPasswordInput() {
    return textInput(_confirmPasswordController, "Confirm Password", true);
  }

  Widget _signUpButton() {
    return elevationButton(_signUp, "Sign Up");
  }

  void _signUp() {
    controller.signUp(_emailController.text, _passwordController.text,
        _confirmPasswordController.text);
  }
}
