// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/AttitudeDataProvider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';

Transform bankAngleGuide(AttitudeDataProvider attitudeData) {
  return Transform.rotate(
    angle: attitudeData.roll * math.pi / 180,
    child: SvgPicture.asset('assets/image/attitudeguidance_bankguide.svg'),
  );
}
