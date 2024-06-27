import 'package:flutter/material.dart';

Widget verticalLine({
  required double height,
  Color color = Colors.black,
  double strokeWidth = 2,
}) {
  return CustomPaint(
    size: Size(strokeWidth, height),
    painter: LinePainter(color: color, strokeWidth: strokeWidth),
  );
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

Widget verticalLineList({
  required int count,
  required double height,
  Color color = Colors.black,
  double strokeWidth = 2,
}) {
  return Column(
    children: List.generate(
      count,
      (index) => verticalLine(
        height: height,
        color: color,
        strokeWidth: strokeWidth,
      ),
    ),
  );
}
