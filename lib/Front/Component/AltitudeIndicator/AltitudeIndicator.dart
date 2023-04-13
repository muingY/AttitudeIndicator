// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/CentralLayoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AltitudeIndicator extends StatefulWidget {
  const AltitudeIndicator({super.key});

  @override
  AltitudeIndicatorState createState() => AltitudeIndicatorState();
}

class AltitudeIndicatorState extends State<AltitudeIndicator> {
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
          SvgPicture.asset('assets/image/altitudeindicator_fixedref.svg'),
          // Gauge
          // Fixed ref top
          SvgPicture.asset('assets/image/altitudeindicator_fixedref_top.svg'),
        ],
      ),
    );
  }
}
