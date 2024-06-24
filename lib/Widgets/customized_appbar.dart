import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:idirtrack/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class CustomizedAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool headline;
  final String? nameHeadLine;
  final bool showSearchBar;

  const CustomizedAppbar({
    super.key,
    required this.headline,
    this.nameHeadLine,
    this.showSearchBar = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(showSearchBar ? 110.0 : 70.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kIconColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      centerTitle: true,
      title: headline
          ? Padding(
              padding: const EdgeInsets.only(top: 11.0),
              child: Text(
                '$nameHeadLine',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : Consumer<VehicleProvider>(
              builder: (context, vehicleProvider, child) {
                return Padding(
                  padding: const EdgeInsets.only(top: 11.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${VehicleProvider.totalVehicleCount} Véhicules',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
            ),
      bottom: showSearchBar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
                child: SearchBarWidget(
                  onSearch: (query) {
                    Provider.of<VehicleProvider>(context, listen: false)
                        .searchVehicles(query);
                  },
                ),
              ),
            )
          : null,
    );
  }
}
