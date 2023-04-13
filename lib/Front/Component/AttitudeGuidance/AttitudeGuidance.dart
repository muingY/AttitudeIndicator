// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/AttitudeDataProvider.dart';
import 'package:attitude_indicator/Back/Provider/Providers/CentralLayoutProvider.dart';
import 'package:attitude_indicator/Front/Component/AttitudeGuidance/AttitudeGuidanceCore.dart';
import 'package:attitude_indicator/Front/Component/AttitudeGuidance/BankAngleGuide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AttitudeGuidance extends StatefulWidget {
  const AttitudeGuidance({super.key});

  @override
  AttitudeGuidanceState createState() => AttitudeGuidanceState();
}

class AttitudeGuidanceState extends State<AttitudeGuidance> {
  @override
  Widget build(BuildContext context) {
    AttitudeDataProvider attitudeData = context.watch<AttitudeDataProvider>();
    CentralLayoutProvider centralLayoutData =
        context.watch<CentralLayoutProvider>();

    return AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            Future.delayed(Duration.zero, () {
              if (centralLayoutData.width != constraints.maxWidth ||
                  centralLayoutData.height != constraints.maxHeight) {
                centralLayoutData.setLayoutSize(
                    constraints.maxWidth, constraints.maxHeight);
              }
            });
            return Stack(
              children: [
                // Fixed ref
                SvgPicture.asset('assets/image/attitudeguidance_fixedref.svg'),
                // Core
                attitudeGuidanceCore(attitudeData),
                // Bank angle guide
                bankAngleGuide(attitudeData),
                // Fixed ref
                SvgPicture.asset(
                    'assets/image/attitudeguidance_fixedref_core.svg'),
              ],
            );
          },
        ));
  }
}
