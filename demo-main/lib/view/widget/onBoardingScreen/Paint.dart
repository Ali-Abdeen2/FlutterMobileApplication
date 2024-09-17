import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';

import '../../../data/datasource/static/static.dart';

class PaintOnBoarding extends StatelessWidget {
  const PaintOnBoarding({super.key, this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(
              Get.width,
              (Get.width * 0.7)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
        ),
        Image.asset(
          "${onBoardingList[index].image}",
          height: Get.height * 0.4,
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = ColorsApp.OnBoardingPaint
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9436000, size.height * 0.5644000);
    path0.cubicTo(
        size.width * 0.9286000,
        size.height * 0.3840000,
        size.width * 0.8849000,
        size.height * 0.1006000,
        size.width * 0.7767900,
        0);
    path0.cubicTo(
        size.width * 0.6718700,
        size.height * -0.0994000,
        size.width * 0.4146100,
        size.height * -0.2186800,
        size.width * 0.1708800,
        size.height * 0.0186200);
    path0.cubicTo(
        size.width * 0.0,
        size.height * 0.2313000,
        size.width * 0.3715100,
        size.height * 0.3401200,
        size.width * 0.1463600,
        size.height * 0.6219200);
    path0.cubicTo(
        size.width * 0.0826100,
        size.height * 0.7202200,
        size.width * 0.0063500,
        size.height * 0.8229000,
        size.width * 0.0790000,
        size.height);
    path0.cubicTo(
        size.width * 0.1408500,
        size.height * 1.2243000,
        size.width * 0.7849500,
        size.height * 1.1105000,
        size.width * 0.8532000,
        size.height * 0.9980000);
    path0.cubicTo(
        size.width * 0.9223000,
        size.height * 0.9194000,
        size.width * 0.9561000,
        size.height * 0.7230000,
        size.width * 0.9436000,
        size.height * 0.5644000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
