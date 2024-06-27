import 'package:flutter/material.dart';

Widget buildVehicleDetailTextWidget(Map<String, dynamic> vehicle) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Make: ${vehicle['make']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Model: ${vehicle['model']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Date: ${vehicle['date']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Location: ${vehicle['location']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Status: ${vehicle['status']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Battery: ${vehicle['battery']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Delay: ${vehicle['delay']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Repair Status: ${vehicle['repairStatus']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Availability: ${vehicle['availability']}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}
