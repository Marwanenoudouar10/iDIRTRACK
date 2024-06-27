import 'package:flutter/material.dart';
import 'package:idirtrack/Screens/Abonnement/abonnements_screen.dart';
import 'package:idirtrack/Screens/CommandScreen/commande_screen.dart';
import 'package:idirtrack/Screens/MaintenanceScreen/maintenance_screen.dart';
import 'package:idirtrack/Screens/Map/mapTest.dart';
import 'package:idirtrack/Widgets/button_principale_screen.dart';
import 'package:idirtrack/Screens/ListVehicleScreen/list_vehicles_screen.dart';
import 'package:idirtrack/Widgets/logout_confirmation_dialog.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/models/location.dart';

class PrincipalePage extends StatefulWidget {
  final Location location;

  const PrincipalePage({super.key, required this.location});

  @override
  // ignore: library_private_types_in_public_api
  _PrincipalePageState createState() => _PrincipalePageState();
}

class _PrincipalePageState extends State<PrincipalePage> {
  void handleLogout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => buildLogoutConfirmationDialog(
        onLogoutConfirmed: () {},
        context: context,
      ),
    );

    if (confirmed == true) {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          '/LoginScreen',
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/exclamation.png',
              color: Colors.white,
              width: 25,
              height: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/map.png',
              color: Colors.white,
              width: 25,
              height: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/logout.png',
              color: Colors.white,
              width: 25,
              height: 25,
            ),
            onPressed: () => handleLogout(context),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            'iDirtrack',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        elevation: 3.0,
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFFD9D9D9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: MyMap(),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/location.png',
                        object: Object,
                        pageName: 'Dernière Position',
                      ),
                      const SizedBox(width: 2),
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/distance.png',
                        object: const MyMap(),
                        pageName: 'Historique',
                      ),
                      const SizedBox(width: 2),
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/dashboard.png',
                        object: Object,
                        pageName: 'Rapports',
                      ),
                      const SizedBox(width: 2),
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/power.png',
                        object: ListCarsWidget(
                          location: widget.location,
                          object: const CommandeScreen(),
                        ),
                        pageName: 'Commandes',
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/maint.png',
                        object: ListCarsWidget(
                          location: widget.location,
                          object: const MaintenanceScreen(),
                        ),
                        pageName: 'Maintenance',
                      ),
                      const SizedBox(width: 2),
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/card.png',
                        object: SubscriptionScreen(
                          showSearchBar: true,
                          location: widget.location,
                        ),
                        pageName: 'Abonnements',
                      ),
                      const SizedBox(width: 2),
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/bell.png',
                        object: Object,
                        pageName: 'Notifications',
                      ),
                      const SizedBox(width: 2),
                      buildCustomizedButton(
                        context: context,
                        imagePath: 'assets/icons/settings.png',
                        object: Object(),
                        pageName: 'Paramètres',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
