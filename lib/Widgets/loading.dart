import 'package:flutter/material.dart';
import 'dart:async'; // for Timer

class LoadingWidget extends StatefulWidget {
  final Duration duration; // Customize the loading duration
  final Widget child; // Widget to display after loading
  final String loginRoute; // Route name for login screen

  const LoadingWidget({
    super.key,
    required this.duration,
    required this.child,
    required this.loginRoute,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, widget.loginRoute);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : widget.child;
  }
}
