import 'package:flutter/material.dart';
import 'package:idirtrack/models/location.dart';

class GlobalState extends ChangeNotifier {
  Location? _location;

  Location? get location => _location;

  void setLocation(Location location) {
    _location = location;
    notifyListeners();
  }
}
