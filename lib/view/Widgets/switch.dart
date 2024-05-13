import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';

class SwitchState extends StatefulWidget {
  const SwitchState({super.key});

  @override
  State<SwitchState> createState() => _SwitchStateState();
}

class _SwitchStateState extends State<SwitchState> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchValue,
      onChanged: (newValue) {
        setState(() {
          _switchValue = newValue;
        });
      },
      activeColor: kSwitchOnColor,
      inactiveThumbColor: Colors.white,
    );
  }
}
