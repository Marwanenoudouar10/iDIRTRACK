import 'package:flutter/material.dart';

class SideListWidget extends StatelessWidget {
  const SideListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'MIDLUM 40255-A-20',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo3.png',
                        width: 70.0, // Set the width of the image
                        height: 70.0, // Set the height of the image
                        fit: BoxFit
                            .cover, // Ensure the image covers the oval shape
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        10), // Add some space between the image and the text
              ],
            ),
          ),
          const ListTile(
            title: Text('Carte grise'),
            leading: Icon(Icons.card_travel),
          ),
          const ListTile(
            title: Text('Assurance'),
            leading: Icon(Icons.receipt_long),
          ),
          const ListTile(
            title: Text('Visite technique'),
            leading: Icon(Icons.build),
          ),
          const ListTile(
            title: Text('Permis'),
            leading: Icon(Icons.assignment_ind),
          ),
          const ListTile(
            title: Text('Autre'), // Add an "Autre" option if needed
            trailing: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
