import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idirtrack/Widgets/switch.dart';
import 'package:idirtrack/providers/switch_provider.dart';
import 'package:provider/provider.dart';

Widget buildSwitchTypes(BuildContext context) {
  return ChangeNotifierProvider(
    create: (context) => SwitchProvider(),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          buildSwitchRow(
            context: context,
            text: 'Sous utilisateur',
            onTap: null,
          ),
          buildSwitchRow(
            context: context,
            text: 'Serveur',
            onTap: () => _showBottomSheet(context),
          ),
        ],
      ),
    ),
  );
}

Widget buildSwitchRow({
  required BuildContext context,
  required String text,
  VoidCallback? onTap,
}) {
  return Row(
    children: [
      const SwitchState(),
      const SizedBox(width: 8),
      GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ],
  );
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Consumer<SwitchProvider>(
        builder: (context, provider, child) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildListTile(
                  context: context,
                  title: 'SERVER 1',
                  assetPath: 'assets/icons/server2.svg',
                  color: provider.server1Color,
                  onTap: () => provider.updateServerColor(1),
                ),
                buildListTile(
                  context: context,
                  title: 'SERVER 2',
                  assetPath: 'assets/icons/server2.svg',
                  color: provider.server2Color,
                  onTap: () => provider.updateServerColor(2),
                ),
                buildListTile(
                  context: context,
                  title: 'SERVER 3',
                  assetPath: null,
                  color: provider.server3Color,
                  onTap: () => provider.updateServerColor(3),
                  icon: const Icon(Icons.room_service_rounded),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget buildListTile({
  required BuildContext context,
  required String title,
  String? assetPath,
  required Color color,
  required VoidCallback onTap,
  Widget? icon,
}) {
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
