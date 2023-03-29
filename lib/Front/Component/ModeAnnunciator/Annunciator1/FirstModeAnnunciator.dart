// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Theme/Theme.dart';
import 'package:flutter/material.dart';

class FirstModeAnnunciator extends StatefulWidget {
  const FirstModeAnnunciator({super.key});

  @override
  FirstModeAnnunciatorState createState() => FirstModeAnnunciatorState();
}

class FirstModeAnnunciatorState extends State<FirstModeAnnunciator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'SPEED',
          style: TextStyle(
              fontSize: FontSizeTable.normal, color: ColorTable.green),
        ),
      ],
    );
  }
}
