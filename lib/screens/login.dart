import 'package:authentication/service/authentication_service.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _authentication = AuthenticationService();
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Center(
          child: Container(
            child: ElevatedButton(
              onPressed: () async {
                print(await _authentication.signInAnonymously());
              },
              child: Text("Login Anonymously"),
            ),
          ),
        ));
  }
}
