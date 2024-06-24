import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/Widgets/switch.dart';

class SwitchTypes extends StatefulWidget {
  const SwitchTypes({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
              const SwitchState(),
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
            children: [
              _buildListTile(
                context,
                'SERVER 1',
                'assets/icons/server2.svg',
                _server1Color,
                () => _updateServerColor(1),
              ),
              _buildListTile(
                context,
                'SERVER 2',
                'assets/icons/server2.svg',
                _server2Color,
                () => _updateServerColor(2),
              ),
              _buildListTile(
                context,
                'SERVER 3',
                null,
                _server3Color,
                () => _updateServerColor(3),
                icon: const Icon(Icons.room_service_rounded),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListTile(BuildContext context, String title, String? assetPath,
      Color color, VoidCallback onTap,
      {Widget? icon}) {
    return GestureDetector(
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
      child: ListTile(
        leading: assetPath != null
            ? SvgPicture.asset(
                assetPath,
                width: 25,
                height: 25,
              )
            : icon,
        title: Text(title, style: TextStyle(color: color)),
      ),
    );
  }

  void _updateServerColor(int serverNumber) {
    setState(() {
      _server1Color = serverNumber == 1 ? kButtonColor : Colors.black;
      _server2Color = serverNumber == 2 ? kButtonColor : Colors.black;
      _server3Color = serverNumber == 3 ? kButtonColor : Colors.black;
    });
  }
}
