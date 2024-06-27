import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';

class SwitchProvider with ChangeNotifier {
  Color _server1Color = Colors.black;
  Color _server2Color = Colors.black;
  Color _server3Color = Colors.black;

  Color get server1Color => _server1Color;
  Color get server2Color => _server2Color;
  Color get server3Color => _server3Color;

  void updateServerColor(int serverNumber) {
    _server1Color = serverNumber == 1 ? kButtonColor : Colors.black;
    _server2Color = serverNumber == 2 ? kButtonColor : Colors.black;
    _server3Color = serverNumber == 3 ? kButtonColor : Colors.black;
    notifyListeners();
  }
}
