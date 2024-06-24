import 'package:flutter/material.dart';
import 'package:idirtrack/Screens/MaintenanceScreen/maintenance_screen.dart';
import 'package:idirtrack/Widgets/list_cars.dart';
import 'package:idirtrack/data/data.dart';

class MaintenanceImpl extends StatelessWidget {
  final String token;
  final int userId;

  const MaintenanceImpl({super.key, required this.token, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ListCarsWidget(
      token: token,
      userId: userId,
      object: MaintenanceScreen(
        data: Kdata,
        locationId: userId,
      ),
    );
  }
}
