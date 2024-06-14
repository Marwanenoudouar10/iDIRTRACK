import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VehicleProvider with ChangeNotifier {
  List<Map<String, dynamic>> _filteredVehicles = [];
  List<Map<String, dynamic>> _vehicles = [];
  // ignore: unused_field
  String _searchQuery = '';
  String _token = "";
  int _userId = 2;

  VehicleProvider(String token, int userId) {
    _token = token;
    _userId = userId;
    fetchVehicles();
  }

  int get totalVehicleCount => _vehicles.length;
  List<Map<String, dynamic>> get filteredVehicles => _filteredVehicles;

  Future<void> fetchVehicles() async {
    // ignore: unnecessary_null_comparison
    if (_token == null || _userId == null) return;

    final response = await http.get(
      Uri.parse('http://192.168.1.26:8081/api/locations/$_userId/vehicles'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> vehiclesJson = jsonDecode(response.body);

      // Populate both _vehicles and _filteredVehicles with the fetched data
      _vehicles = vehiclesJson
          .map((vehicleMap) => {
                'make': vehicleMap['make'],
                'model': vehicleMap['model'],
                'name': vehicleMap['name'],
                'date': vehicleMap['date'],
                'location': vehicleMap['location'],
                'status': vehicleMap['status'],
                'battery': vehicleMap['battery'],
                'delay': vehicleMap['delay'],
                'repairStatus': vehicleMap['repairStatus'],
                'availability': vehicleMap['availability'],
              })
          .toList();

      // Initialize _filteredVehicles with all vehicles initially
      _filteredVehicles = List.from(_vehicles);

      notifyListeners();
    } else {
      throw Exception('Failed to load vehicles');
    }
  }

  void searchVehicles(String query) {
    _searchQuery = query;
    _filteredVehicles = _vehicles
        .where((vehicle) =>
            vehicle['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
