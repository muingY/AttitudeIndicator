// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/AttitudeDataProvider.dart';
import 'package:attitude_indicator/Front/Component/AttitudeGuidance/AttitudeGuidancePainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class AttitudeGuidance extends StatefulWidget {
  const AttitudeGuidance({super.key});

  @override
  AttitudeGuidanceState createState() => AttitudeGuidanceState();
}

class AttitudeGuidanceState extends State<AttitudeGuidance> {
  @override
  Widget build(BuildContext context) {
    AttitudeDataProvider attitudeData = context.watch<AttitudeDataProvider>();

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          // Fixed ref
          SvgPicture.asset('assets/image/attitudeguidance_fixedref.svg'),
          // Core
          Container(
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
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
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
          ),
          // Bank angle guide
          Transform.rotate(
            angle: attitudeData.roll * math.pi / 180,
            child:
                SvgPicture.asset('assets/image/attitudeguidance_bankguide.svg'),
          ),
          // Fixed ref
          SvgPicture.asset('assets/image/attitudeguidance_fixedref_core.svg'),
        ],
      ),
    );
  }
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
