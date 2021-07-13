import 'package:authentication/controllers/authentication_controller.dart';
import 'package:authentication/screens/home.dart';
import 'package:authentication/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWrapper extends GetWidget<AuthenticationController> {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthenticationController>().user?.uid != null)
            ? Home()
            : SignIn();
      },
    );
  }
}
