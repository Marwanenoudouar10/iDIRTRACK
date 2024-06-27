import 'package:flutter/material.dart';

Widget buildCustomizeButton({
  required bool borderExist,
  required VoidCallback onPressed,
  required String label,
  required Color buttonColor,
}) {
  return SizedBox(
    width: 370,
    height: 60,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: borderExist
              ? const BorderSide(color: Colors.white, width: 1)
              : BorderSide.none,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    ),
  );
}
