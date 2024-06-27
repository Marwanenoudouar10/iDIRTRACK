import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/models/vehicle.dart';

class VehicleProvider with ChangeNotifier {
  List<Vehicle> _vehicles = [];
  List<Vehicle> _filteredVehicles = [];
  final int _locationId;
  bool _isLoading = false;
  String? _errorMessage;

  VehicleProvider(this._locationId) {
    fetchVehicles();
  }

  List<Vehicle> get filteredVehicles => _filteredVehicles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get totalVehicleCount => _vehicles.length;

  Future<void> fetchVehicles() async {
    _setLoading(true);
    try {
      final response = await http.get(
        Uri.parse(
            'http://$kIpAddress:8081/api/locations/$_locationId/vehicles'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> vehiclesJson = jsonDecode(response.body);
        _vehicles = vehiclesJson
            .map((vehicleJson) => Vehicle.fromJson(vehicleJson))
            .toList();
        _filteredVehicles = List.from(_vehicles);
      } else {
        _setError('Failed to load vehicles');
      }
    } catch (e) {
      _setError('An error occurred: $e');
    } finally {
      _setLoading(false);
    }
  }

  void searchVehicles(String query) {
    _filteredVehicles = _vehicles
        .where((vehicle) =>
            vehicle.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Vehicle? getVehicleById(int searchedId) {
    return _vehicles.firstWhere(
      (vehicle) => vehicle.id == searchedId,
    );
  }

  void clearSearch() {
    _filteredVehicles = _vehicles;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
