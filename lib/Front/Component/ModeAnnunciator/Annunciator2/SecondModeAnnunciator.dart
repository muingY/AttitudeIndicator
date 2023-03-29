// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Theme/Theme.dart';
import 'package:flutter/material.dart';

class SecondModeAnnunciator extends StatefulWidget {
  const SecondModeAnnunciator({super.key});

  @override
  SecondModeAnnunciatorState createState() => SecondModeAnnunciatorState();
}

class SecondModeAnnunciatorState extends State<SecondModeAnnunciator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'G/S',
          style: TextStyle(
              fontSize: FontSizeTable.normal, color: ColorTable.green),
        ),
      ],
    );
  }
}
