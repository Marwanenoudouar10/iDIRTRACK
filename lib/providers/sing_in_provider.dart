import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  String _username = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;
  String get getUsername => _username;
  String get getPassword => _password;
  bool get getIsLoading => _isLoading;
  String? get getErrorMessage => _errorMessage;
  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPasswrod(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> signIn() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 2));
      if (_password == "admin" && _username == "admin") {
      } else {
        _errorMessage = "Wrong password or username";
      }
    } catch (e) {
      _errorMessage = 'An error ocurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
