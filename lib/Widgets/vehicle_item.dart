import 'package:flutter/material.dart';
import 'package:idirtrack/models/vehicle.dart';

class VehicleItem extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleItem({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.4, vertical: 2),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
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
                      child: Image.asset('assets/icons/truck.png'),
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
                      child: Center(child: Text(vehicle.delay)),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      vehicle.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(vehicle.date),
                  ),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(vehicle.location),
                  ),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(right: 45, top: 11),
                    child: Container(
                      width: 75,
                      decoration: BoxDecoration(
                        color: vehicle.availability == 'En retard'
                            ? Colors.red
                            : const Color(0xFF2FD56F),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(child: Text(vehicle.availability)),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 77,
                      height: 25,
                      decoration: BoxDecoration(
                        color: vehicle.status == 'En marche'
                            ? const Color(0xFF2FD56F)
                            : Colors.red,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(child: Text(vehicle.status)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0153A5),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(
                          child: Text(
                        vehicle.battery,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
