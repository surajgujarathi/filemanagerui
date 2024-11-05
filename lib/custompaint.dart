import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final double progress; // progress from 0.0 to 1.0
  final Color color;
  final double strokeWidth;

  ArcPainter(this.progress, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded edges

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final startAngle = -3.14 / 2; // Start from the top
    final sweepAngle = 2 * 3.14 * progress; // Sweep based on progress

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
