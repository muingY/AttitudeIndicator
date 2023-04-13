import 'package:attitude_indicator/Back/Provider/Providers/CentralLayoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class VerticalSpeedIndicator extends StatefulWidget {
  const VerticalSpeedIndicator({super.key});

  @override
  VerticalSpeedIndicatorState createState() => VerticalSpeedIndicatorState();
}

class VerticalSpeedIndicatorState extends State<VerticalSpeedIndicator> {
  @override
  Widget build(BuildContext context) {
    CentralLayoutProvider centralLayoutData =
        context.watch<CentralLayoutProvider>();

    return Container(
      alignment: Alignment.center,
      height: centralLayoutData.height,
      child: Stack(
        children: [
          // Fixed ref
          SvgPicture.asset('assets/image/verticalspeed_fixedref.svg'),
          // Gauge
        ],
      ),
    );
  }
}
