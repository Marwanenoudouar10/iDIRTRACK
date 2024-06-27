import 'package:flutter/material.dart';

Widget buildLogoutConfirmationDialog({
  required BuildContext context,
  required VoidCallback onLogoutConfirmed,
}) {
  return AlertDialog(
    title: const Text('Confirmation de déconnexion'),
    content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: const Text('Annuler'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context, true);
          onLogoutConfirmed();
        },
        child: const Text('Oui'),
      ),
    ],
  );
}
