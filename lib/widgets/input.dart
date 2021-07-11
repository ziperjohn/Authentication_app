import 'package:flutter/material.dart';

Widget textInput(TextEditingController controller, String label) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      controller: controller,
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
