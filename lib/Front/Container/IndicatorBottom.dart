// ignore_for_file: file_names
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
        Expanded(
          flex: 6,
          child: Container(), // Heading reference
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }
}
