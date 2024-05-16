import 'package:flutter/material.dart';

class CustomizedButtonPrincipale extends StatelessWidget {
  final Icon icon;
  const CustomizedButtonPrincipale({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.246,
        height: MediaQuery.of(context).size.height * 0.12,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const Text(
                    'Derniere Position',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 7,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
      ),
    ]);
  }
}
