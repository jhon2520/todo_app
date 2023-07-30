import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';

class CustomPaintedCurve extends CustomPainter{

  @override
void paint(Canvas canvas, Size size) {


    canvas.drawPaint(Paint()..color = Colors.white);
    canvas.translate(size.width / 2, 0);

    final width = size.width / 2;

    Path bezierPath = Path()
      ..moveTo(-width, size.height)
      ..lineTo(-width, size.height * 0.9)
      ..cubicTo(
        -width * 0.2,
        size.height * 0.4,
        0,
        size.height * 0.95,
        width,
        size.height * 0.4,
      )
      ..lineTo(width, size.height);

    final bezierPaint = Paint()
      ..shader = LinearGradient(
        colors: [
        AppColors.mainColor,
        AppColors.secondColor,
      ]).createShader(Offset(-width, size.height) & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }


}