import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/customized_appbar.dart';
import 'package:idirtrack/Widgets/vehicle_item.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:idirtrack/models/location.dart';
import 'package:provider/provider.dart';

class ListCarsWidget extends StatelessWidget {
  final Location location;
  final Widget object;

  const ListCarsWidget({
    super.key,
    required this.location,
    required this.object,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VehicleProvider(location.id as int),
      child: Scaffold(
        appBar: const CustomizedAppbar(
          headline: false,
          showSearchBar: true,
        ),
        backgroundColor: const Color(0xFFECECEC),
        body: Column(
          children: [
            Expanded(
              child: Consumer<VehicleProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.errorMessage != null) {
                    return Center(child: Text(provider.errorMessage!));
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
                        return buildVehicleItem(
                          provider.filteredVehicles[index],
                          object,
                          context,
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
