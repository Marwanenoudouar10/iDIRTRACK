import 'package:flutter/material.dart';
import 'package:idirtrack/models/vehicle.dart';

Widget buildSmallShip(Vehicle vehicle) {
  return Container(
    width: 62,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 179, 178, 178),
      borderRadius: BorderRadius.circular(0),
    ),
    child: Center(child: Text(vehicle.delay)),
  );
}
