import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/Widgets/switch.dart';

class SwitchTypes extends StatefulWidget {
  const SwitchTypes({Key? key}) : super(key: key);

  @override
  _SwitchTypesState createState() => _SwitchTypesState();
}

class _SwitchTypesState extends State<SwitchTypes> {
  Color _server1Color = Colors.black;
  Color _server2Color = Colors.black;
  Color _server3Color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          const Row(
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
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: const Text(
                  'Serveur',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _server1Color = kButtonColor;
                  });
                  // Handle action
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/server2.svg',
                    width: 25,
                    height: 25,
                  ),
                  title:
                      Text('SERVER 1', style: TextStyle(color: _server1Color)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _server2Color = kButtonColor;
                  });
                  // Handle action
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/server2.svg',
                    width: 25,
                    height: 25,
                  ),
                  title:
                      Text('SERVER 2', style: TextStyle(color: _server2Color)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _server3Color = kButtonColor;
                  });
                  // Handle action
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading:
                      Icon(Icons.room_service_rounded, color: _server3Color),
                  title:
                      Text('SERVER 3', style: TextStyle(color: _server3Color)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
