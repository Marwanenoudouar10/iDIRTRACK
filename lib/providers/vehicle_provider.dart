import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idirtrack/models/vehicle.dart';

class VehicleProvider with ChangeNotifier {
  List<Vehicle> _filteredVehicles = [];
  // ignore: unused_field
  String _searchQuery = '';
  List<Vehicle> _vehicles = [];
  String _token = "";
  int _userId = 2;

  VehicleProvider(String token, int userId) {
    _token = token;
    _userId = userId;
    fetchVehicles();
  }
  int get totalVehicleCount => _vehicles.length;
  List<Vehicle> get filteredVehicles => _filteredVehicles;

  get http => null;

  Future<void> fetchVehicles() async {
    if (_token == null || _userId == null) return;

    final response = await http.get(
      Uri.parse(
          'http://192.168.1.26:8081/api/locations/$_userId/vehicles'), // Use userId to fetch vehicles
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> vehiclesJson = jsonDecode(response.body);
      _filteredVehicles =
          vehiclesJson.map((json) => Vehicle.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load vehicles');
    }
  }

  void searchVehicles(String query) {
    _searchQuery = query;
    _filteredVehicles = _vehicles
        .where((vehicle) =>
            vehicle.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
