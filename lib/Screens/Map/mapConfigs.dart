// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapConfig extends StatefulWidget {
//   const MapConfig({super.key});

//   @override
//   State<MapConfig> createState() => _MapConfigState();
// }

// class _MapConfigState extends State<MapConfig> {
//   late GoogleMapController mapController;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           child: GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               mapController = controller;
//             },
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(37.7749, -122.4194),
//               zoom: 12.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
