import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/search_bar.dart';
import 'package:idirtrack/Widgets/vehicle_item.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListCarsWidget extends StatelessWidget {
  final String token;
  final int userId;
  Object object;
  ListCarsWidget(
      {super.key,
      required this.object,
      required this.token,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VehicleProvider(token, userId),
      child: Scaffold(
        backgroundColor: const Color(0xFFECECEC),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              color: const Color(0xFF0054A5),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Center(child: SearchBarWidget()),
              ),
            ),
            Expanded(
              child: Consumer<VehicleProvider>(
                builder: (context, provider, child) {
                  if (provider.filteredVehicles.isEmpty) {
                    if (kDebugMode) {
                      print("No vehicles available");
                    } // Debug print
                    return const Center(child: Text('No vehicles available'));
                  }
                  if (kDebugMode) {
                    print("Displaying vehicles: ${provider.filteredVehicles}");
                  }
                  return ListView.builder(
                    itemCount: provider.filteredVehicles.length,
                    itemBuilder: (context, index) {
                      return VehicleItem(
                        vehicle: provider.filteredVehicles[index],
                        object: object,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
