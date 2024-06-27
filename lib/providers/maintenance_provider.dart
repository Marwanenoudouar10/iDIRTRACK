import 'dart:io';
import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/utils/utils_file.dart';

class MaintenanceProvider with ChangeNotifier {
  File? frontImage;
  File? backImage;
  bool isUploading = false;
  String? errorMessage;

  Future<void> pickImageAndUpload({
    required int vehicleId,
    required int locationId,
    required BuildContext context,
  }) async {
    frontImage = await pickImage();
    backImage = await pickImage();

    if (frontImage != null && backImage != null) {
      await uploadDocuments(
        backendUrl: 'http://$kIpAddress',
        backImage: backImage!,
        frontImage: frontImage!,
        vehicleId: vehicleId,
        locationId: locationId,
        context: context,
      );
    }
    notifyListeners();
  }
}
