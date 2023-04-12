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
          SvgPicture.asset('assets/image/attitudeguidance_fixedref.svg'),
          Transform.rotate(
            angle: attitudeData.roll * math.pi / 180,
            child:
                SvgPicture.asset('assets/image/attitudeguidance_bankguide.svg'),
          ),
          SvgPicture.asset('assets/image/attitudeguidance_fixedref_core.svg'),
        ],
      ),
    );
  }
}
