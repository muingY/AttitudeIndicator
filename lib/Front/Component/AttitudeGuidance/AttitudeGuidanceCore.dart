// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/AttitudeDataProvider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';

Container attitudeGuidanceCore(AttitudeDataProvider attitudeData) {
  return Container(
    alignment: Alignment.center,
    // padding: const EdgeInsets.all(0),
    child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const double widthRatio = 0.77;
      const double heightRatio = 0.77;
      return SizedBox(
          width: constraints.maxWidth * widthRatio,
          height: constraints.maxHeight * heightRatio,
          child: ClipOval(
            clipper: AttitudeGuidanceCoreClipper(),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Transform.rotate(
                angle: attitudeData.roll * math.pi / 180,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                        constraints.maxHeight *
                            ((attitudeData.pitch / 90.0) * 1.943))
                    ..scale(5.3),
                  child: SvgPicture.asset(
                      'assets/image/attitudeguidance_core.svg'),
                ),
              );
            }),
          ));
    }),
  );
}

class AttitudeGuidanceCoreClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final double radius = math.min(size.width, size.height) * 0.5;

    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
