import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/container_widget.dart';
import 'package:idirtrack/models/vehicle.dart';

Widget buildVehicleItem(Vehicle vehicle, Widget object, BuildContext context) {
  return Card(
    child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => object),
        );
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      leading: _buildVehicleImage(),
      title: Text(
        vehicle.name,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: _buildVehicleStatus(vehicle),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.timer,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(vehicle.date),
            ],
          ),
          Row(
            children: [
              Text(vehicle.location),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildVehicleImage() {
  return buildContainer(
    const Image(
      image: AssetImage('assets/icons/truck.png'),
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    ),
  );
}

Widget _buildVehicleStatus(Vehicle vehicle) {
  return Column(
    children: [
      Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          decoration: BoxDecoration(
            color: vehicle.status == 'En marche'
                ? const Color(0xFF2FD56F)
                : Colors.red,
          ),
          child: Text(
            vehicle.status,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      ),
      const SizedBox(height: 3.0),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 1.0),
        decoration: BoxDecoration(
          color: vehicle.availability == 'En retard'
              ? Colors.red
              : const Color(0xFF2FD56F),
        ),
        child: Text(
          vehicle.availability,
          style: const TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
    ],
  );
}
