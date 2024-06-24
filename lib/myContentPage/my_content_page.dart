import 'package:flutter/material.dart';

class MyPageContent extends StatelessWidget {
  final Map<String, dynamic> data;

  const MyPageContent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: data['content'] is String
          ? Text(data['content'])
          : data['content'] is Widget
              ? data['content'] as Widget
              : const Text('Unknown content type'),
    );
  }
}
