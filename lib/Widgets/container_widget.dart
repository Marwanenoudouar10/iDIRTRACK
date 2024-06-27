import 'package:flutter/material.dart';

Widget buildContainer(Widget image) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.105),
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: Colors.grey.withOpacity(0.2)),
    ),
    child: image,
  );
}
