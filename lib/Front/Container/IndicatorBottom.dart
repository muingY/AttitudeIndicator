// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Component/HeadingReference/HeadingReference.dart';
import 'package:flutter/material.dart';

class IndicatorBottom extends StatelessWidget {
  const IndicatorBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(),
        ),
        const Expanded(
          flex: 6,
          child: HeadingReference(),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }
}
