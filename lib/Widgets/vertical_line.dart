import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  final double height;
  final Color color;
  final double strokeWidth;

  const VerticalLine({
    super.key,
    required this.height,
    this.color = Colors.black,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(strokeWidth, height),
      painter: LinePainter(color: color, strokeWidth: strokeWidth),
    );
  }
}

class LinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  LinePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    canvas.drawLine(
      Offset(size.width / 2, 0), // Starting point (center of width, top)
      Offset(size.width / 2,
          size.height), // Ending point (center of width, bottom)
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class VerticalLineList extends StatelessWidget {
  final int count;
  final double height;
  final Color color;
  final double strokeWidth;

  VerticalLineList({
    Key? key,
    required this.count,
    required this.height,
    this.color = Colors.black,
    this.strokeWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        count,
        (index) => VerticalLine(
          height: height,
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Vertical Line List Example')),
      body: VerticalLineList(count: 5, height: 100, color: Colors.blue),
    ),
  ));
}
