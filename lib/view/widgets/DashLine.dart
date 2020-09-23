import 'package:flutter/material.dart';

class DashLine extends CustomPainter {
  final double x,y;
  final int height;

  DashLine(this.x, this.y, this.height);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 1.5
      ..color = Colors.grey[400];
    // var max = 20;
    var max = height;
    var dashHeight = 8;
    var dashSpace = 2;
    double startY = y;
    while (max >= 0) {
      canvas.drawLine(
          Offset(x, startY), Offset(x, startY + dashHeight), paint);
      final space = (dashSpace + dashHeight);
      startY += space;
      max -= space;
    }
  }

  // -1, 12.5

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}