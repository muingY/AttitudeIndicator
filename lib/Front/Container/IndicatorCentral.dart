// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Component/AttitudeGuidance/AttitudeGuidance.dart';
import 'package:flutter/material.dart';

class IndicatorCentral extends StatelessWidget {
  const IndicatorCentral({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(), // Speed indicator
        ),
        const Expanded(
          flex: 6,
          child: AttitudeGuidance(),
        ),
        Expanded(
          flex: 2,
          child: Container(), // Altitude indicator
        ),
      ],
    );
  }
}
