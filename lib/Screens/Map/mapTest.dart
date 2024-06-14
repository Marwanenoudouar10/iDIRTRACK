// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idirtrack/configs/Maps/api_maps_places.dart'; // Assuming this is the file path

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final Set<Polyline> _polylines = {};
  final LatLng _startLocation = const LatLng(31.791702, -7.603403); // Morocco
  final LatLng _endLocation = const LatLng(34.025373, -6.802417);

  @override
  void initState() {
    super.initState();
    _createPolyline();
  }

  void _createPolyline() async {
    final ApiMapsPlaces apiMapsPlaces = ApiMapsPlaces(); // Create an instance
    final List<LatLng> points =
        await apiMapsPlaces.getRouteCoordinates(_startLocation, _endLocation);
    if (points.isNotEmpty) {
      final Polyline polyline = Polyline(
        polylineId: const PolylineId('polyline_id'),
        points: points,
        color: Colors.blue,
        width: 3,
      );
      setState(() {
        _polylines.add(polyline);
      });
    } else {
      if (kDebugMode) {
        print('Failed to fetch route coordinates or API error.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _startLocation,
              zoom: 10,
            ),
            mapType: MapType.normal,
            polylines: _polylines,
          ),
        ],
      ),
    );
  }
}
