import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idirtrack/configs/auth_response.dart';
import 'package:idirtrack/models/location.dart';

class LoginProvider with ChangeNotifier {
  bool _isVisible = false;
  bool _obscureText = true;
  bool _hasError = false;

  bool get isVisible => _isVisible;
  bool get obscureText => _obscureText;
  bool get hasError => _hasError;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggleVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void setError(bool value) {
    _hasError = value;
    notifyListeners();
  }

  void initializeVisibility() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _isVisible = true;
      notifyListeners();
    });
  }

  Future<Location?> authenticate(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    try {
      final authResponse = AuthResponse();
      final location = await authResponse.authenticate(username, password);

      if (location != null && BCrypt.checkpw(password, location.password)) {
        return location;
      } else {
        setError(true);
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to authenticate: $e');
      }
      setError(true);
      return null;
    }
  }
}
