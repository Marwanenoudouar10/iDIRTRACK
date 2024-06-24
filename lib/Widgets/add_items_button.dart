import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';

class CircleIconButton extends StatelessWidget {
  final Function() onPressed;
  const CircleIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: kIconColor,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(15.0), // Adjust padding as needed
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30.0, // Adjust icon size as needed
      ),
    );
  }
}
