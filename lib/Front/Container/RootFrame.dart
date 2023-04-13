// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Container/IndicatorBottom.dart';
import 'package:attitude_indicator/Front/Container/IndicatorCentral.dart';
import 'package:attitude_indicator/Front/Container/IndicatorSide.dart';
import 'package:attitude_indicator/Front/Container/ModeAnnunciator.dart';
import 'package:attitude_indicator/Front/Theme/Theme.dart';
import 'package:flutter/material.dart';

class RootFrame extends StatelessWidget {
  const RootFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTable.background,
        body: Row(
          children: [
            Expanded(
              flex: 9,
              child: Column(children: const [
                Expanded(
                  flex: 15,
                  child: ModeAnnunciator(),
                ),
                Expanded(
                  flex: 70,
                  child: IndicatorCentral(),
                ),
                Expanded(
                  flex: 15,
                  child: IndicatorBottom(),
                ),
              ]),
            ),
            const Expanded(
              flex: 1,
              child: IndicatorSide(),
            )
          ],
        ));
  }
}
