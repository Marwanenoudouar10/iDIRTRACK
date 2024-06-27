import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/subscription_card.dart';
import 'package:idirtrack/widgets/customized_appbar.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:idirtrack/models/location.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatelessWidget {
  final Location location;
  final bool showSearchBar;

  const SubscriptionScreen({
    super.key,
    required this.location,
    this.showSearchBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VehicleProvider(location.id as int),
      child: Scaffold(
        appBar: CustomizedAppbar(
          headline: false,
          showSearchBar: showSearchBar,
        ),
        backgroundColor: const Color(0xFFECECEC),
        body: Consumer<VehicleProvider>(
          builder: (context, vehicleProvider, child) {
            if (vehicleProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (vehicleProvider.errorMessage != null) {
              return Center(child: Text(vehicleProvider.errorMessage!));
            } else if (vehicleProvider.filteredVehicles.isEmpty) {
              return const Center(child: Text('No Subscriptions founds'));
            } else {
              return ListView.builder(
                itemCount: vehicleProvider.filteredVehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = vehicleProvider.filteredVehicles[index];
                  return buildSubscriptionCard(
                    title: vehicle.name,
                    startDate: DateTime.parse(vehicle.date),
                    endDate: DateTime.parse(vehicle.date)
                        .add(const Duration(days: 365)),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
