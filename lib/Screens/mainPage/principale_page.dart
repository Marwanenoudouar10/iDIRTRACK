import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/Widgets/customized_button_principale.dart';
import 'package:idirtrack/models/location.dart';

class PrincipalePage extends StatelessWidget {
  PrincipalePage({super.key});
  Location location = Location('admin', 'admin');
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
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            location.username,
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
              child: Container(
                color: const Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.app_blocking),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.access_alarm),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.access_alarms_outlined),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.app_blocking),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.access_alarm),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.zoom_out),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.abc_sharp),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomizedButtonPrincipale(
                        icon: Icon(Icons.access_alarms),
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
