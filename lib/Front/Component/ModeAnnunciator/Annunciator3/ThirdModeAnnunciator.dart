// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Theme/Theme.dart';
import 'package:flutter/material.dart';

class ThirdModeAnnunciator extends StatefulWidget {
  const ThirdModeAnnunciator({super.key});

  @override
  ThirdModeAnnunciatorState createState() => ThirdModeAnnunciatorState();
}

class ThirdModeAnnunciatorState extends State<ThirdModeAnnunciator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'LOC',
          style: TextStyle(
              fontSize: FontSizeTable.normal, color: ColorTable.green),
        ),
      ],
    );
  }
}
