import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';

class CustomAddTaksButton extends CustomPainter{

  @override
      void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = AppColors.mainColor;
    paint.strokeWidth = 2.0;
    Path path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
    //  Positioned(
    //           bottom: 0,
    //           left: 0,
    //           child: Container(
    //             alignment: Alignment.topCenter,
    //             height: 100,
    //             width: size.width,
    //             // color: Colors.red,
    //             child: CustomPaint(
                  
    //               painter: CustomAddTaksButton(),
    //               child: Container(
    //               ) ,
    //             ),
                
    //           ),
    //         )


}