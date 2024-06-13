import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'MIDLUM 40255-A-20',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          ListTile(
            title: Text('Carte grise'),
            leading: Icon(Icons.card_travel),
          ),
          ListTile(
            title: Text('Assurance'),
            leading: Icon(Icons.receipt_long),
          ),
          ListTile(
            title: Text('Visite technique'),
            leading: Icon(Icons.build),
          ),
          ListTile(
            title: Text('Permis'),
            leading: Icon(Icons.assignment_ind),
          ),
          ListTile(
            title: Text('Autre'), // Add an "Autre" option if needed
            trailing: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
