import 'package:flutter/material.dart';
import 'package:idirtrack/models/vihicule.dart';

class SmallShip extends StatelessWidget {
  final Vehicle vehicle;
  const SmallShip({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 179, 178, 178),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(child: Text(vehicle.delay)),
    );
  }
}
