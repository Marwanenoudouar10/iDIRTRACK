import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class DocumentProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<int> _frontDocumentBytes = [];
  List<int> _backDocumentBytes = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<int> get frontDocumentBytes => _frontDocumentBytes;
  List<int> get backDocumentBytes => _backDocumentBytes;

  Future<void> requestPermission() async {
    await [Permission.camera, Permission.storage].request();
  }

  Future<File?> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
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
      _isLoading = true;
      notifyListeners();

      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        _frontDocumentBytes = base64Decode(jsonResponse['frontDocument']);
        _backDocumentBytes = base64Decode(jsonResponse['backDocument']);
        notifyListeners();
      } else {
        _errorMessage = 'Failed to load documents: ${response.statusCode}';
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
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

    try {
      _isLoading = true;
      notifyListeners();

      var response = await request.send();

      if (response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        showReviewMessage(context);
      } else {
        _errorMessage = 'Failed to upload documents';
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
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
                  File? image = await pickImage(ImageSource.gallery);
                  if (image != null) {
                    onImagePicked(image);
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Appareil photo'),
                onTap: () async {
                  File? image = await pickImage(ImageSource.camera);
                  if (image != null) {
                    onImagePicked(image);
                  }
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
}
