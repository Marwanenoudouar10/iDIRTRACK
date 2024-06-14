import 'package:flutter/material.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final Function onLogoutConfirmed;

  const LogoutConfirmationDialog({Key? key, required this.onLogoutConfirmed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context, true); // Pass true to indicate confirmation
          },
          child: const Text('Oui'),
        ),
      ],
    );
  }
}
