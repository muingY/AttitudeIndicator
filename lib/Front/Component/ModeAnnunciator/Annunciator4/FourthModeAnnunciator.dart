// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/SerialCummProvider.dart';
import 'package:attitude_indicator/Front/Theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FourthModeAnnunciator extends StatefulWidget {
  const FourthModeAnnunciator({super.key});

  @override
  FourthModeAnnunciatorState createState() => FourthModeAnnunciatorState();
}

class FourthModeAnnunciatorState extends State<FourthModeAnnunciator> {
  String _getFPSString(SerialCummProvider serialCummData) {
    switch (serialCummData.cummState) {
      case CummState.normal:
        return '30 FPS';
      case CummState.disconnected:
        return 'LOS';
    }
  }

  @override
  Widget build(BuildContext context) {
    SerialCummProvider serialCummData = context.watch<SerialCummProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'PORT',
          style: TextStyle(
              fontSize: FontSizeTable.normal, color: ColorTable.white),
        ),
        Text(
          _getFPSString(serialCummData),
          style: const TextStyle(
              fontSize: FontSizeTable.small, color: ColorTable.white),
        ),
      ],
    );
  }
}
