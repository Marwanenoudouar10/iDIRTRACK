import 'package:flutter/material.dart';
import 'package:idirtrack/Screens/LastPositionScreen/last_position_screen.dart';
import 'package:idirtrack/Screens/Map/mapTest.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/Widgets/customized_button_principale.dart';

class PrincipalePage extends StatelessWidget {
  final String token;
  final int userId;

  const PrincipalePage({Key? key, required this.token, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            'iDirtrack',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
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
            Expanded(
              child: MapScreen(),
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
                        icon: const Icon(Icons.app_blocking),
                        object:
                            LastPositionScreen(token: token, userId: userId),
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        icon: const Icon(Icons.access_alarm),
                        object: MapScreen(),
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        icon: const Icon(Icons.access_alarms_outlined),
                        object:
                            LastPositionScreen(token: token, userId: userId),
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        icon: const Icon(Icons.app_blocking),
                        object:
                            LastPositionScreen(token: token, userId: userId),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomizedButtonPrincipale(
                        icon: const Icon(Icons.access_alarm),
                        object:
                            LastPositionScreen(token: token, userId: userId),
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        icon: const Icon(Icons.zoom_out),
                        object:
                            LastPositionScreen(token: token, userId: userId),
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        icon: const Icon(Icons.abc_sharp),
                        object:
                            LastPositionScreen(token: token, userId: userId),
                      ),
                      const SizedBox(width: 2),
                      CustomizedButtonPrincipale(
                        icon: const Icon(Icons.access_alarms),
                        object:
                            LastPositionScreen(token: token, userId: userId),
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
