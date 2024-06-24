import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

Future<void> requestPermission() async {
  await [
    Permission.camera,
    Permission.storage,
  ].request();
}

Future<File?> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

void showPickerDialog(
    BuildContext context, bool isFront, Function(ImageSource, bool) onPick) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galerie de photos'),
              onTap: () {
                onPick(ImageSource.gallery, isFront);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Appareil photo'),
              onTap: () {
                onPick(ImageSource.camera, isFront);
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

Future<void> getDocuments({
  required BuildContext context,
  required int locationId,
  required int vehicleId,
  required String backendUrl,
}) async {
  String url =
      '$backendUrl/api/documents/locations/$locationId/vehicles/$vehicleId';

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the JSON response
      var jsonResponse = json.decode(response.body);

      // Assuming the response contains fields for front and back documents
      String frontDocumentBase64 = jsonResponse['frontDocument'];
      String backDocumentBase64 = jsonResponse['backDocument'];

      // Decode the base64 strings
      List<int> frontDocumentBytes = base64Decode(frontDocumentBase64);
      List<int> backDocumentBytes = base64Decode(backDocumentBase64);

      // Do something with the documents, for example, display them in the UI
      // You can create an Image widget from the bytes and show it in a dialog or a new screen
      // ignore: use_build_context_synchronously
      showDocuments(context, frontDocumentBytes, backDocumentBytes);
    } else {
      // Handle the error
      if (kDebugMode) {
        print('Failed to load documents: ${response.statusCode}');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}

void showDocuments(BuildContext context, List<int> frontDocumentBytes,
    List<int> backDocumentBytes) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Documents'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            frontDocumentBytes.isNotEmpty
                ? Image.memory(Uint8List.fromList(frontDocumentBytes))
                : const Text('No front document available'),
            const SizedBox(height: 10),
            backDocumentBytes.isNotEmpty
                ? Image.memory(Uint8List.fromList(backDocumentBytes))
                : const Text('No back document available'),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> uploadDocuments({
  required BuildContext context,
  required File frontImage,
  required File backImage,
  required int locationId,
  required int vehicleId,
  required String backendUrl,
}) async {
  String url =
      '$backendUrl/api/documents/locations/$locationId/vehicles/$vehicleId';

  List<int> frontBytes = await frontImage.readAsBytes();
  List<int> backBytes = await backImage.readAsBytes();

  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.fields['type'] = 'document';
  request.files.add(http.MultipartFile.fromBytes('frontFile', frontBytes,
      filename: 'frontDocument.jpg'));
  request.files.add(http.MultipartFile.fromBytes('backFile', backBytes,
      filename: 'backDocument.jpg'));

  var response = await request.send();
  if (response.statusCode == 201) {
    // ignore: use_build_context_synchronously
    showReviewMessage(context);
  } else {
    // Handle the error
  }
}
