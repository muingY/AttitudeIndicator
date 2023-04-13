// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/CentralLayoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SpeedIndicator extends StatefulWidget {
  const SpeedIndicator({super.key});

  @override
  SpeedIndicatorState createState() => SpeedIndicatorState();
}

class SpeedIndicatorState extends State<SpeedIndicator> {
  @override
  Widget build(BuildContext context) {
    CentralLayoutProvider centralLayoutData =
        context.watch<CentralLayoutProvider>();

    return Container(
      alignment: Alignment.centerLeft,
      height: centralLayoutData.height * 0.88,
      child: Stack(
        children: [
          // Fixed ref
          SvgPicture.asset('assets/image/speedindicator_fixedref.svg'),
          // Gauge
          // Fixed ref top
          SvgPicture.asset('assets/image/speedindicator_fixedref_top.svg'),
        ],
      ),
    );
  }
}
