import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      // Permission granted
      setState(() {});
    } else if (status.isDenied) {
      // Permission denied
      await Permission.location.request();
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, navigate to settings
      openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Permission.location.status,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final permissionStatus = snapshot.data as PermissionStatus;
          if (permissionStatus.isGranted) {
            return GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.7749, -122.4194),
                zoom: 12.0,
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Location permission is denied'),
                  TextButton(
                    onPressed: _requestLocationPermission,
                    child: Text('Request Permission'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
