// ignore_for_file: file_names
import 'dart:collection';
import 'package:attitude_indicator/Back/Utils/AngleMovingAverage.dart';
import 'package:flutter/material.dart';

class AttitudeDataProvider extends ChangeNotifier {
  /* States */
  double pitch = 0.0;
  double roll = 0.0;
  double yaw = 0.0;

  static const int _scopeSize = 15;
  final Queue<double> _pitchQueue = Queue<double>();
  final Queue<double> _yawQueue = Queue<double>();

  final AngleMovingAverage _rollFilter =
      AngleMovingAverage(scopeSize: _scopeSize);

  /* Actions */
  void updatePitchRollYaw(String rawStr) {
    List<String> splitedRawString = rawStr.split(',');
    if (splitedRawString.length != 3) {
      return;
    }

    _pitchQueue.add(double.parse(splitedRawString[0]));
    _yawQueue.add(double.parse(splitedRawString[2]));

    if (_pitchQueue.length > _scopeSize) {
      _pitchQueue.removeFirst();
      _yawQueue.removeFirst();
    }

    pitch = _pitchQueue.reduce((a, b) => a + b) / _pitchQueue.length;
    roll = _rollFilter.update(double.parse(splitedRawString[1]));
    yaw = _yawQueue.reduce((a, b) => a + b) / _yawQueue.length;

    notifyListeners();
  }
}
