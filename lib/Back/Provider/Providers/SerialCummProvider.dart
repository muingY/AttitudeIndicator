// ignore_for_file: file_names
import 'package:flutter/material.dart';

enum CummState { normal, disconnected }

class SerialCummProvider with ChangeNotifier {
  /* States */
  CummState cummState = CummState.disconnected;

  /* Actions */
  void updateCummState(CummState cummState) {
    this.cummState = cummState;
    notifyListeners();
  }
}
