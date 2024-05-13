import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  final bool borderExist;
  final VoidCallback onPressed;
  final String label;
  final Color buttonColor;
  const CustomizeButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.buttonColor,
    required this.borderExist,
  });

  @override
  Widget build(BuildContext context) {
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
                : BorderSide.none, // Set border radius to 0
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
    );
  }
}
