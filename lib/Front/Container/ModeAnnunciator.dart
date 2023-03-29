// ignore_for_file: file_names
import 'package:attitude_indicator/Front/Component/ModeAnnunciator/Annunciator1/FirstModeAnnunciator.dart';
import 'package:attitude_indicator/Front/Component/ModeAnnunciator/Annunciator2/SecondModeAnnunciator.dart';
import 'package:attitude_indicator/Front/Component/ModeAnnunciator/Annunciator3/ThirdModeAnnunciator.dart';
import 'package:attitude_indicator/Front/Component/ModeAnnunciator/Annunciator4/FourthModeAnnunciator.dart';
import 'package:attitude_indicator/Front/Theme/Theme.dart';
import 'package:flutter/material.dart';

class ModeAnnunciator extends StatelessWidget {
  const ModeAnnunciator({super.key});

  Container annunciatorCell({Widget? child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(
                  color: ColorTable.grey, width: WidthTable.normal))),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: annunciatorCell(child: const FirstModeAnnunciator()),
      ),
      Expanded(
        flex: 1,
        child: annunciatorCell(child: const SecondModeAnnunciator()),
      ),
      Expanded(
        flex: 1,
        child: annunciatorCell(child: const ThirdModeAnnunciator()),
      ),
      Expanded(
        flex: 1,
        child: annunciatorCell(child: const FourthModeAnnunciator()),
      ),
    ]);
  }
}
