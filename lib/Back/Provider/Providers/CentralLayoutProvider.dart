// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CentralLayoutProvider extends ChangeNotifier {
  /* States */
  double width = 0.0;
  double height = 0.0;

  /* Actions */
  void setLayoutSize(double width, double height) {
    this.width = width;
    this.height = height;

    notifyListeners();
  }
}
