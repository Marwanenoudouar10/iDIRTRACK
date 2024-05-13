import 'package:flutter/material.dart';
import 'package:idirtrack/view/Widgets/switch.dart';

class SwitchTypes extends StatelessWidget {
  const SwitchTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              SwitchState(),
              SizedBox(
                width: 8,
              ),
              Text(
                'Sous utilisateur',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              SwitchState(),
              SizedBox(
                width: 8,
              ),
              Text(
                'Serveur',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
