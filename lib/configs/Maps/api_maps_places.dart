import 'dart:convert';
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idirtrack/constant.dart';

class ApiMapsPlaces {
  get http => HttpClient();

  Future<List<LatLng>> getRouteCoordinates(
      LatLng origin, LatLng destination) async {
    const String apiKey = kApiMapsKey;
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    print("Not yet");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<LatLng> points = [];
      final steps = data['routes'][0]['legs'][0]['steps'];
      for (var step in steps) {
        final encodedPoints = step['polyline']['points'];
        points.addAll(_decodePolyLine(encodedPoints));
        print("Secces");
      }
      return points;
    } else {
      print("Error in Api place maps");
      return [];
    }
  }

  List<LatLng> _decodePolyLine(String encodedPoints) {
    List<LatLng> points = [];
    int index = 0;
    int exp = 0;
    double lat = 0;
    double lng = 0;

    while (index < encodedPoints.length) {
      int byte = encodedPoints.codeUnitAt(index) - 63;
      index++;
      bool more = true;
      lat = 0;
      lng = 0;

      do {
        int encodedDigit = byte & 0x1f;
        lat += encodedDigit << exp;
        exp += 5;
        more = byte & 0x20 != 0;
        byte >>= 5;
      } while (more);

      exp = 0;
      do {
        int encodedDigit = byte & 0x1f;
        lng += encodedDigit << exp;
        exp += 5;
        more = byte & 0x20 != 0;
        byte >>= 5;
      } while (more);

      lat /= 100000.0;
      lng /= 100000.0;

      points.add(LatLng(lat, lng));
    }

    return points;
  }
}
