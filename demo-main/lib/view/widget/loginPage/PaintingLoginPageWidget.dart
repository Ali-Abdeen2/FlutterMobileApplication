// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

// import 'package:get/get.dart';

// class PaintLoginPage2 extends StatelessWidget {
//   const PaintLoginPage2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.string(
//       '<svg viewBox="1236.4 162.6 223.6 358.5" ><defs><linearGradient id="gradient" x1="-0.125437" y1="-0.116563" x2="1.18816" y2="0.9857"><stop offset="0.0" stop-color="#339933" /><stop offset="1.0" stop-color="#e3fbe3" /></linearGradient></defs><path transform="translate(1037.0, -4.0)" d="M 226.6107177734375 167.9693756103516 C 197.4099273681641 173.4692077636719 181.800048828125 190.6000671386719 232.2000579833984 274.2000732421875 C 282.6000671386719 357.8000793457031 221.5992126464844 431.7996520996094 219.4000396728516 463.2001342773438 C 217.2008666992188 494.6006164550781 267.800048828125 551.6001586914062 373.4000854492188 511.2001342773438 C 479.0001220703125 470.8001098632812 387.19384765625 413.2298583984375 362.0000915527344 402.2001037597656 C 336.8063354492188 391.1703491210938 318.4009399414062 307.600341796875 342.4000854492188 274.2000732421875 C 425.4010620117188 169.7001953125 255.8115081787109 162.4695434570312 226.6107177734375 167.9693756103516 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="round" /></svg>',
//       allowDrawingOutsideViewBox: true,
//       // fit: BoxFit.fill,
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'dart:ui' as ui;
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:get/get.dart';

// // class PaintLoginPage extends StatelessWidget {
// //   const PaintLoginPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SvgPicture.string(
// //       '<svg viewBox="499.5 188.7 410.5 336.5" ><defs><linearGradient id="gradient" x1="0.2611" y1="0.294652" x2="1.18816" y2="0.9857"><stop offset="0.0" stop-color="#339933" /><stop offset="1.0" stop-color="#e3fbe3" /></linearGradient></defs><path transform="translate(487.0, 0.0)" d="M 225.8000640869141 193.4000396728516 C 196.5992736816406 198.8998718261719 181.800048828125 190.6000671386719 232.2000579833984 274.2000732421875 C 282.6000671386719 357.8000793457031 148.4000396728516 320.3000793457031 112.4000244140625 306.7000732421875 C 76.40000915527344 293.1000671386719 4.799995422363281 306.300048828125 13.19999980926514 389.5000915527344 C 21.60000419616699 472.7001342773438 67.99928283691406 460.7996826171875 85.20001983642578 449.9001159667969 C 102.4007568359375 439.0005493164062 91.800048828125 362.0000915527344 172.6000518798828 382.0000915527344 C 253.4000549316406 402.0000915527344 221.5992126464844 431.7996520996094 219.4000396728516 463.2001342773438 C 217.2008666992188 494.6006164550781 267.800048828125 551.6001586914062 373.4000854492188 511.2001342773438 C 479.0001220703125 470.8001098632812 387.19384765625 413.2298583984375 362.0000915527344 402.2001037597656 C 336.8063354492188 391.1703491210938 318.4009399414062 307.600341796875 342.4000854492188 274.2000732421875 C 425.4010620117188 169.7001953125 255.0008544921875 187.9002075195312 225.8000640869141 193.4000396728516 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="round" /></svg>',
// //       allowDrawingOutsideViewBox: true,
// //       fit: BoxFit.fill,
// //     );
// //   }
// // }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PaintLoginPage2 extends StatelessWidget {
  const PaintLoginPage2({super.key});

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
      ..strokeWidth = 3.72;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.51, size.height * 0.52),
        Offset(size.width * 0.83, size.height * 0.52),
        [const Color(0xff91c994), Color(0xff70bb5f)],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(size.width * 0.6533333, size.height * 0.3217143);
    path0.quadraticBezierTo(size.width * 0.6135250, size.height * 0.2153857,
        size.width * 0.5672500, size.height * 0.3030000);
    path0.cubicTo(
        size.width * 0.5349167,
        size.height * 0.3375000,
        size.width * 0.5086917,
        size.height * 0.3655286,
        size.width * 0.5339167,
        size.height * 0.4090000);
    path0.cubicTo(
        size.width * 0.5512083,
        size.height * 0.4332857,
        size.width * 0.6294833,
        size.height * 0.4327429,
        size.width * 0.6583333,
        size.height * 0.5157143);
    path0.cubicTo(
        size.width * 0.6879167,
        size.height * 0.6446429,
        size.width * 0.6693167,
        size.height * 0.6443571,
        size.width * 0.6800167,
        size.height * 0.6913143);
    path0.cubicTo(
        size.width * 0.7019750,
        size.height * 0.8168000,
        size.width * 0.7451750,
        size.height * 0.7436857,
        size.width * 0.7633333,
        size.height * 0.7200000);
    path0.cubicTo(
        size.width * 0.8203333,
        size.height * 0.6718571,
        size.width * 0.8263333,
        size.height * 0.6132857,
        size.width * 0.7966667,
        size.height * 0.5914286);
    path0.cubicTo(
        size.width * 0.7747917,
        size.height * 0.5650000,
        size.width * 0.7343750,
        size.height * 0.5727143,
        size.width * 0.7091667,
        size.height * 0.4857143);
    path0.quadraticBezierTo(size.width * 0.6800417, size.height * 0.4187143,
        size.width * 0.6533333, size.height * 0.3217143);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
