import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:idirtrack/global/global_state.dart';

class VehicleItem extends StatelessWidget {
  final Map<String, dynamic> vehicle;
  final Widget object;
  const VehicleItem({super.key, required this.vehicle, required this.object});

  @override
  Widget build(BuildContext context) {
    Provider.of<GlobalState>(context, listen: false)
        .setVehicleId(vehicle['id']);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => object),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.4, vertical: 2),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: double.infinity,
          height: 115,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildVehicleImageColumn(),
              _buildVehicleInfoColumn(),
              _buildVehicleStatusColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildVehicleImageColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 2,
              ),
            ),
            child: Image.asset(
              'assets/icons/truck.png',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            width: 62,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 179, 178, 178),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(child: Text(vehicle['delay'])),
          ),
        ),
      ],
    );
  }

  Column _buildVehicleInfoColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              vehicle['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ),
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Row(
            children: [
              Icon(Icons.timelapse, color: Colors.grey[700]),
              const SizedBox(width: 2),
              Text(vehicle['date'], style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Row(
            children: [
              Icon(Icons.location_city, color: Colors.grey[700]),
              const SizedBox(width: 2),
              Text(vehicle['location']),
            ],
          ),
        ),
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(right: 70, top: 0),
          child: Container(
            width: 93,
            height: 25,
            decoration: BoxDecoration(
              color: vehicle['availability'] == 'En retard'
                  ? Colors.red
                  : const Color(0xFF2FD56F),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(child: Text(vehicle['availability'])),
          ),
        ),
      ],
    );
  }

  Column _buildVehicleStatusColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 77,
          height: 20,
          decoration: BoxDecoration(
            color: vehicle['status'] == 'En marche'
                ? const Color(0xFF2FD56F)
                : Colors.red,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Center(child: Text(vehicle['status'])),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Container(
            width: 50,
            height: 25,
            decoration: BoxDecoration(
              color: const Color(0xFF0153A5),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: Text(
                vehicle['battery'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
