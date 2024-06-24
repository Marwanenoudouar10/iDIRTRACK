import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idirtrack/constant.dart';

class VehicleProvider with ChangeNotifier {
  static List<Map<String, dynamic>> _vehicles = [];
  List<Map<String, dynamic>> _filteredVehicles = [];
  String _token = "";
  int _userId = 2;
  bool _isLoading = false; // Loading state

  VehicleProvider(String token, int userId) {
    _token = token;
    _userId = userId;
    fetchVehicles();
  }

  static int get totalVehicleCount => _vehicles.length;
  List<Map<String, dynamic>> get filteredVehicles => _filteredVehicles;
  bool get isLoading => _isLoading; // Getter for loading state

  Future<void> fetchVehicles() async {
    // ignore: unnecessary_null_comparison
    if (_token == null || _userId == null) return;

    _isLoading = true; // Start loading
    notifyListeners();

    final response = await http.get(
      Uri.parse('http://$kIpAddress:8081/api/locations/$_userId/vehicles'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> vehiclesJson = jsonDecode(response.body);
      _vehicles = vehiclesJson
          .map((vehicleMap) => {
                'id': vehicleMap['id'],
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

      _filteredVehicles = List.from(_vehicles);
    } else {
      throw Exception('Failed to load vehicles');
    }

    _isLoading = false; // End loading
    notifyListeners();
  }

  void searchVehicles(String query) {
    _filteredVehicles = _vehicles
        .where((vehicle) =>
            vehicle['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  static Future<void> fetchVehiclesStatic(String token, int userId) async {
    // ignore: unnecessary_null_comparison
    if (token == null || userId == null) return;

    final response = await http.get(
      Uri.parse('http://192.168.1.10:8081/api/locations/$userId/vehicles'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> vehiclesJson = jsonDecode(response.body);
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
    } else {
      throw Exception('Failed to load vehicles');
    }
  }

  void clearSearch() {
    _filteredVehicles = _vehicles;
    notifyListeners();
  }
}
