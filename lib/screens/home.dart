import 'package:authentication/controllers/authentication_controller.dart';
import 'package:authentication/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<AuthenticationController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
          child: Center(
              child: Column(
            children: [
              elevationButton(() {
                print(controller.user?.uid);
              }, "UID"),
              elevationButton(() {
                controller.signOut();
              }, "Sign Out"),
            ],
          )),
        ));
  }
}
