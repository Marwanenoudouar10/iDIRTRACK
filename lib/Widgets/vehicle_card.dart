import 'package:flutter/material.dart';
import 'package:idirtrack/models/vihicule.dart';

class VehicleCard extends StatefulWidget {
  final Vehicle vehicle;

  const VehicleCard({required this.vehicle});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleCardState createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  bool _isExpanded = false;

  void _moveWidget() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _moveWidget();
        Navigator.pushNamed(context, '/');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.4, vertical: 2),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: _isExpanded ? double.infinity : double.infinity,
          height: _isExpanded ? 150 : 100,
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
                          color: Colors.black
                              .withOpacity(0.1), // Light black border
                          width: 2, // Adjust the width as needed
                        ),
                      ),
                      child: Image.asset(
                        'assets/icons/truck.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 62,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 179, 178, 178),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(child: Text(widget.vehicle.delay)),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      widget.vehicle.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(widget.vehicle.date),
                  ),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(widget.vehicle.location),
                  ),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(right: 45),
                    child: Container(
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2FD56F),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(child: Text(widget.vehicle.availability)),
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
                        color: widget.vehicle.status == 'En marche'
                            ? const Color(0xFF2FD56F)
                            : Colors.red,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(child: Text(widget.vehicle.status)),
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
                        widget.vehicle.battery,
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
