import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/vehicle_card.dart';
import 'package:idirtrack/models/location.dart';
import 'package:idirtrack/models/vihicule.dart';

class LastPosition extends StatefulWidget {
  final Location location;

  const LastPosition({super.key, required this.location});

  @override
  State<LastPosition> createState() => _LastPositionState();
}

class _LastPositionState extends State<LastPosition> {
  late List<Vehicle> _vehicles;
  List<Vehicle> _filteredVehicles = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _vehicles = widget.location.getVehicles();
    _filteredVehicles = _vehicles;
  }

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
      _filteredVehicles = _vehicles
          .where((vehicle) =>
              vehicle.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECEC),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 110,
              color: const Color(0xFF0054A5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(child: SearchBar(onSearch: _onSearch)),
              )),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _filteredVehicles.map((vehicle) {
                  return VehicleCard(vehicle: vehicle);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  SearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  '100 Vehicule',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.white),
              hintText: 'Rechercher ....',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 14),
            ),
            onSubmitted: onSearch,
            onChanged: onSearch,
          ),
        ),
      ],
    );
  }
}
