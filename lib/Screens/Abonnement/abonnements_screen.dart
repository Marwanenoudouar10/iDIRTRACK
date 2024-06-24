import 'package:flutter/material.dart';
import 'package:idirtrack/widgets/customized_appbar.dart';
import 'package:idirtrack/Widgets/subscription_card.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatefulWidget {
  final bool showSearchBar;

  const SubscriptionScreen({super.key, this.showSearchBar = false});

  @override
  // ignore: library_private_types_in_public_api
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VehicleProvider>(context, listen: false).clearSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizedAppbar(
        headline: false,
        showSearchBar: widget.showSearchBar,
      ),
      body: Consumer<VehicleProvider>(
        builder: (context, vehicleProvider, child) {
          if (vehicleProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vehicleProvider.filteredVehicles.isEmpty) {
            return const Center(child: Text('No vehicles found'));
          }

          return ListView.builder(
            itemCount: vehicleProvider.filteredVehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicleProvider.filteredVehicles[index];
              return SubscriptionCard(
                title: vehicle['name'],
                startDate: DateTime.parse(vehicle['date']),
                endDate: DateTime.parse(vehicle['date'])
                    .add(const Duration(days: 365)),
              );
            },
          );
        },
      ),
    );
  }
}
