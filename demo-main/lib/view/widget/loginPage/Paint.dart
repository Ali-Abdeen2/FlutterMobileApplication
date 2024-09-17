import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class PaintLoginPage extends StatelessWidget {
  const PaintLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          Get.width,
          (Get.width * 0.5620503597122302)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.15, size.height * -0.02),
        Offset(size.width * 0.31, size.height * 0.50),
        [Color(0xff339933), Color(0xffE3FBE3)],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(size.width * -0.0035700, size.height * -0.0173600);
    path0.quadraticBezierTo(size.width * -0.0039100, size.height * 0.7540000,
        size.width * -0.0040300, size.height * 1.0114200);
    path0.cubicTo(
        size.width * 0.3131500,
        size.height * 1.0161200,
        size.width * 0.3025300,
        size.height * 0.9701800,
        size.width * 0.1572700,
        size.height * 0.7406200);
    path0.cubicTo(
        size.width * 0.0816000,
        size.height * 0.6426600,
        size.width * 0.0352000,
        size.height * 0.5142400,
        size.width * 0.1031400,
        size.height * 0.2578600);
    path0.quadraticBezierTo(size.width * 0.1380100, size.height * 0.0467200,
        size.width * -0.0035700, size.height * -0.0173600);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
