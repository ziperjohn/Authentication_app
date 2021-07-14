import 'package:flutter/material.dart';

Widget textInput(
    TextEditingController controller, String label, bool isPassword) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        labelText: label,
      ),
    ),
  );
}
