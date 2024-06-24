import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/models/location.dart';
import 'package:idirtrack/models/vehicle.dart';

class ApiService {
  final String baseUrl = "http://$kIpAddress:8081/api";
  Future<List<Location>> fetchLocations() async {
    final response = await http.get(Uri.parse('$baseUrl/locations'));
    if (response.statusCode == 200) {
      final List<dynamic> locationsJson = jsonDecode(response.body);
      return locationsJson.map((json) => Location.fromJason(json)).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Future<Location> createLocation(Location location) async {
    final response = await http.post(
      Uri.parse('$baseUrl/locations'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(location.toJson()),
    );

    if (response.statusCode == 200) {
      return Location.fromJason(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create location');
    }
  }

  Future<void> deleteLocation(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/locations/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete location');
    }
  }

  Future<List<Vehicle>> fetchVehicles(int locationId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/locations/$locationId/vehicles'));
    if (response.statusCode == 200) {
      final List<dynamic> vehiclesJson = jsonDecode(response.body);
      return vehiclesJson.map((json) => Vehicle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicles');
    }
  }

  Future<Vehicle> createVehicle(int locationId, Vehicle vehicle) async {
    final response = await http.post(
      Uri.parse('$baseUrl/locations/$locationId/vehicles'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(vehicle.toJson()),
    );

    if (response.statusCode == 200) {
      return Vehicle.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create vehicle');
    }
  }

  Future<void> deleteVehicle(int locationId, int vehicleId) async {
    final response = await http.delete(
        Uri.parse('$baseUrl/locations/$locationId/vehicles/$vehicleId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete vehicle');
    }
  }
}
