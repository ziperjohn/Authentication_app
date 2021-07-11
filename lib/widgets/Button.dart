import 'package:flutter/material.dart';

Widget textButton(void Function() onPressed, String label) {
  return TextButton(
    onPressed: onPressed,
    child: Text(label),
  );
}

Widget elevationButton(void Function() onPressed, String label) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(label),
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

Widget elevationIconButton(void Function() onPressed, String label, Icon icon) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: icon,
    label: Text(label),
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
