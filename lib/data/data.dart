import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
List<Map<String, dynamic>> Kdata = [
  {"title": "Carte grise", "content": const Text("You have 5 new messages.")},
  {
    "title": "Visite",
    "content": const Text("View your most important emails.")
  },
  {
    "title": "Permet",
    "content": const Text("See the emails you've sent recently.")
  },
  {
    "title": "Assurance",
    "content": ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/icons/id_card.png'),
            ),
          ),
          title: Text("Mail 1"),
          subtitle: Text("Detail 1"),
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text("Mail 2"),
          subtitle: Text("Detail 2"),
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text("Mail 3"),
          subtitle: Text("Detail 3"),
        ),
      ],
    ),
  }
];
