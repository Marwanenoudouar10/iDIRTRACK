// global_state.dart
import 'package:flutter/foundation.dart';

class GlobalState with ChangeNotifier {
  String _token = '';
  int _userId = 2;
  int _vehicleId = -1;
  String get token => _token;
  int get userId => _userId;

  int get vehicleId => _vehicleId;

  void setVehicleId(int id) {
    _vehicleId = id;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setUserId(int userId) {
    _userId = userId;
    notifyListeners();
  }
}
