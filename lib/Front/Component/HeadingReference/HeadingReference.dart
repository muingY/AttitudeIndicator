// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/CentralLayoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HeadingReference extends StatefulWidget {
  const HeadingReference({super.key});

  @override
  HeadingReferenceState createState() => HeadingReferenceState();
}

class HeadingReferenceState extends State<HeadingReference> {
  @override
  Widget build(BuildContext context) {
    CentralLayoutProvider centralLayoutData =
        context.watch<CentralLayoutProvider>();

    return Container(
      alignment: Alignment.center,
      width: centralLayoutData.width * 0.88,
      child: Stack(
        children: [
          // Fixed ref
          SvgPicture.asset('assets/image/headingreference_fixedref.svg'),
          // Gauge
          // Fixed ref top
          SvgPicture.asset('assets/image/headingreference_fixedref_top.svg'),
        ],
      ),
    );
  }
}
