import 'package:authentication/controllers/authentication_controller.dart';
import 'package:authentication/widgets/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<AuthenticationController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Column(
                  children: [
                    Text("User UID: ${controller.user?.uid}"),
                    Text("User E-mail: ${controller.user?.email}"),
                  ],
                );
              }),
              _signOutButton(),
            ],
          ),
        ));
  }

  Widget _signOutButton() {
    return elevationButton(_signOut, "Sign Out");
  }

  void _signOut() {
    controller.signOut();
  }
}
