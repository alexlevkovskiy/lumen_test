import 'dart:ui';

import 'package:flutter/material.dart';

class CustomChart extends CustomPainter {
  final List spots;

  CustomChart(this.spots);

  @override
  void paint(Canvas canvas, Size size) {
    //line 1
    // final x1 = Offset(0, 100);
    // final y1 = Offset(250, 250);
    // final paint1 = Paint()
    //   ..color = Colors.black
    //   ..strokeWidth = 4;
    // canvas.drawLine(x1, y1, paint1);

    // // line 2
    // final x2 = Offset(50, 100);
    // final y2 = Offset(250, 150);
    // final paint2 = Paint()
    //   ..color = Colors.black
    //   ..strokeWidth = 4;
    // canvas.drawLine(x2, y2, paint2);
    final pointMode = PointMode.polygon;
    final points = <Offset>[];
    final paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 2;
    spots.asMap().forEach((key, value) {
      points.add(Offset((key - 55.0) * 0.5, value * 0.5));
    });
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
