// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AttitudeDataProvider extends ChangeNotifier {
  /* States */
  double pitch = 0.0;
  double roll = 0.0;
  double yaw = 0.0;

  /* Actions */
  void updatePitchRollYaw(String rawStr) {
    List<String> splitedRawString = rawStr.split(',');
    if (splitedRawString.length != 3) {
      return;
    }

    pitch = double.parse(splitedRawString[0]);
    roll = -(double.parse(splitedRawString[1]));
    yaw = double.parse(splitedRawString[2]);

    notifyListeners();
  }
}
