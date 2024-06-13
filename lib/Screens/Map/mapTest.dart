import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  bool _isPermissionGranted = false;
  bool _isCheckingPermissions = true;

  Future<void> _checkLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isGranted) {
      setState(() {
        _isPermissionGranted = true;
        _isCheckingPermissions = false;
      });
    } else if (status.isDenied) {
      final newStatus = await Permission.location.request();
      if (newStatus.isGranted) {
        setState(() {
          _isPermissionGranted = true;
          _isCheckingPermissions = false;
        });
      } else {
        setState(() {
          _isCheckingPermissions = false;
        });
      }
    } else if (status.isPermanentlyDenied) {
      setState(() {
        _isCheckingPermissions = false;
      });
      openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCheckingPermissions
          ? const Center(child: CircularProgressIndicator())
          : _isPermissionGranted
              ? GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(
                        34.020882, -6.841650), // Centered around Rabat, Morocco
                    zoom:
                        5.0, // Reduced zoom level (1.0 = whole world, 20.0 = very zoomed in)
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Location permission is denied'),
                      TextButton(
                        onPressed: _checkLocationPermission,
                        child: const Text('Request Permission'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
