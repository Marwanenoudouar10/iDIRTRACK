import 'dart:io';
import 'package:flutter/material.dart';
import 'package:idirtrack/utils/utils_file.dart';

Future<void> showPickerDialog(
    BuildContext context, Function(File) onImagePicked) async {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galerie de photos'),
              onTap: () async {
                File? image = await pickImage();
                onImagePicked(image!);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Appareil photo'),
              onTap: () async {
                File? image = await pickImage();
                onImagePicked(image!);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

void showReviewMessage(BuildContext context) {
  Navigator.of(context).pop();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Demande en cours de révision'),
        content: const Text('Votre demande est en cours de révision.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showDocumentsDialog(
    BuildContext context, Function(File) onImagePicked) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              _buildDocumentCard(
                context,
                icon: const AssetImage('assets/icons/id_card.png'),
                text: 'Clicker pour scanner votre permis (verso)',
                onTap: () => showPickerDialog(context, onImagePicked),
              ),
              const SizedBox(height: 20),
              _buildDocumentCard(
                context,
                icon: const AssetImage('assets/icons/id_card_back.png'),
                text: 'Clicker pour scanner votre permis (verso)',
                onTap: () => showPickerDialog(context, onImagePicked),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildDocumentCard(BuildContext context,
    {required String text,
    required AssetImage icon,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: icon,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
