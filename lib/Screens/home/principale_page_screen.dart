import 'package:flutter/material.dart';
import 'package:idirtrack/Screens/Abonnement/abonnements_screen.dart';
import 'package:idirtrack/Screens/LastPositionScreen/last_position_screen.dart';
import 'package:idirtrack/Screens/MaintenanceScreen/maintenance_impl.dart';
import 'package:idirtrack/Screens/Map/mapTest.dart';
import 'package:idirtrack/Widgets/logout_confirmation_dialog.dart';
import 'package:idirtrack/Widgets/side_list.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/Widgets/customized_button_principale.dart';

class PrincipalePage extends StatefulWidget {
  final String token;
  final int userId;

  const PrincipalePage({super.key, required this.token, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _PrincipalePageState createState() => _PrincipalePageState();
}

class _PrincipalePageState extends State<PrincipalePage> {
  void handleLogout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => LogoutConfirmationDialog(
        onLogoutConfirmed: () {},
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
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Drawer(child: SideListWidget())));
            },
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
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
                      CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/location.png',
                        object: LastPositionScreen(
                            token: widget.token, userId: widget.userId),
                        pageName: 'Dernière Position',
                      ),
                      const SizedBox(width: 2),
                      const CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/distance.png',
                        object: MyMap(),
                        pageName: 'Historique',
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/dashboard.png',
                        object: LastPositionScreen(
                            token: widget.token, userId: widget.userId),
                        pageName: 'Rapports',
                      ),
                      const SizedBox(width: 2),
                      const CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/power.png',
                        object: SubscriptionScreen(),
                        pageName: 'Commandes',
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/maint.png',
                        object: MaintenanceImpl(
                            token: widget.token, userId: widget.userId),
                        pageName: 'Maintenance',
                      ),
                      const SizedBox(width: 2),
                      const CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/card.png',
                        object: SubscriptionScreen(
                          showSearchBar: true,
                        ),
                        pageName: 'Abonnements',
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/bell.png',
                        object: LastPositionScreen(
                            token: widget.token, userId: widget.userId),
                        pageName: 'Notifications',
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        imagePath: 'assets/icons/settings.png',
                        object: LastPositionScreen(
                            token: widget.token, userId: widget.userId),
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
