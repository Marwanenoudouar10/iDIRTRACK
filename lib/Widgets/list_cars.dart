import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/customized_appbar.dart';
import 'package:idirtrack/Widgets/vehicle_item.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:provider/provider.dart';

class ListCarsWidget extends StatelessWidget {
  final String token;
  final int userId;
  final Widget object;

  const ListCarsWidget({
    super.key,
    required this.object,
    required this.token,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VehicleProvider(token, userId),
      child: Scaffold(
        appBar: const CustomizedAppbar(
          headline: false,
        ),
        backgroundColor: const Color(0xFFECECEC),
        body: Column(
          children: [
            Expanded(
              child: Consumer<VehicleProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.filteredVehicles.isEmpty) {
                    if (kDebugMode) {
                      print("No vehicles available");
                    }
                    return const Center(child: Text('No vehicles available'));
                  } else {
                    if (kDebugMode) {
                      print(
                          "Displaying vehicles: ${provider.filteredVehicles}");
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
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
