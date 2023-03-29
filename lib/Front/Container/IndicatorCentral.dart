// ignore_for_file: file_names
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
        Expanded(
          flex: 6,
          child: Container(), // Attitude guidance
        ),
        Expanded(
          flex: 2,
          child: Container(), // Altitude indicator
        ),
      ],
    );
  }
}
