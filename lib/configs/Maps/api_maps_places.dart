import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idirtrack/constant.dart';

class ApiMapsPlaces {
  final HttpClient _httpClient = HttpClient();

  Future<List<LatLng>> getRouteCoordinates(
      LatLng origin, LatLng destination) async {
    const String apiKey = kApiMapsKey;
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving&key=$apiKey';

    try {
      final request = await _httpClient.getUrl(Uri.parse(url));
      final response = await request.close();
      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final data = json.decode(responseBody);
        final List<LatLng> points = [];
        final steps = data['routes'][0]['legs'][0]['steps'];
        for (var step in steps) {
          final encodedPoints = step['polyline']['points'];
          points.addAll(_decodePolyLine(encodedPoints));
        }
        return points;
      } else {
        if (kDebugMode) {
          print("API error: ${response.statusCode}");
        }
        return [];
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print("Network error: $e");
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        print("Unexpected error: $e");
      }
      return [];
    }
  }

  List<LatLng> _decodePolyLine(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }
}
