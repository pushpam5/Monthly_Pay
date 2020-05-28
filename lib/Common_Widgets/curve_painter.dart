import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    var paint = Paint();
    paint.shader = ui.Gradient.linear(Offset(0, size.height * 0.25),Offset(size.width, size.height / 2), [Colors.lightBlue[600],Colors.blue[300] ]);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width / 2, size.height  / 2, size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0,0);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}