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
    switch (serialCummData.commState) {
      case CommState.normal:
        return '${1000 ~/ serialCummData.deltaTime.inMilliseconds} FPS';
      case CommState.disconnected:
        return 'LOS';
    }
  }

  @override
  Widget build(BuildContext context) {
    SerialCummProvider serialCummData = context.watch<SerialCummProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<String>(
            items: serialCummData.availablePorts.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                // child: Text(value),
                child: Text(
                  value,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  maxLines: 1,
                ),
              );
            }).toList(),
            isExpanded: true,
            dropdownColor: const Color.fromARGB(255, 50, 50, 50),
            style: const TextStyle(
                color: ColorTable.white, fontSize: FontSizeTable.small),
            value: serialCummData.currentPort,
            onTap: () => {serialCummData.updateAvailablePorts()},
            onChanged: (dynamic value) {
              serialCummData.changeCurrentPort(value);
              serialCummData.setConnection(value);
            }),
        Text(
          _getFPSString(serialCummData),
          style: const TextStyle(
              fontSize: FontSizeTable.small, color: ColorTable.white),
        ),
      ],
    );
  }
}
