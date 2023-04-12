// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttitudeGuidancePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /* Attitude guidance */
    Paint attitudeGuidanceBasicPaint = Paint()
      ..color = ColorTable.sky
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
        center, size.width / 2 - 30.0, attitudeGuidanceBasicPaint);

    /* Fixed reference */
    Paint fixedRefPaint = Paint()
      ..color = ColorTable.white
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 3.0;

    List<Offset> top = [
      Offset(size.width / 2, 0.0),
      Offset(size.width / 2, 30.0)
    ];
    Offset right1 = Offset(size.width - 30.0, size.height / 2);
    Offset right2 = Offset(size.width, size.height / 2);
    Offset bottom1 = Offset(size.width / 2, size.height - 30.0);
    Offset bottom2 = Offset(size.width / 2, size.height);
    Offset left1 = Offset(0.0, size.height / 2);
    Offset left2 = Offset(30.0, size.height / 2);

    canvas.drawLine(top[0], top[1], fixedRefPaint);
    canvas.drawLine(right1, right2, fixedRefPaint);
    canvas.drawLine(bottom1, bottom2, fixedRefPaint);
    canvas.drawLine(left1, left2, fixedRefPaint);

    SvgPicture.asset('assets/image/AttitudeGuidance_FixedRef.svg');
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
