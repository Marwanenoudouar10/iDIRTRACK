import 'package:flutter/material.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Consumer<VehicleProvider>(
                builder: (context, provider, child) => Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    '${provider.totalVehicleCount} Véhicules', // Update text
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Consumer<VehicleProvider>(
            builder: (context, provider, child) {
              return TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Rechercher ....',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
                onSubmitted: provider.searchVehicles,
                onChanged: provider.searchVehicles,
              );
            },
          ),
        ),
      ],
    );
  }
}
