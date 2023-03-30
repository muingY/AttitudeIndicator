// ignore_for_file: file_names
import 'dart:typed_data';

import 'package:attitude_indicator/Back/Utils/Uint8ListUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

enum CommState { normal, disconnected }

class SerialCummProvider with ChangeNotifier {
  /* States */
  CommState commState = CommState.disconnected;

  SerialPort? serialPort;
  SerialPortReader? reader;
  List<String> availablePorts = ["none"] + SerialPort.availablePorts;
  String currentPort = "none";

  String recvData = "";
  Uint8List _recvRawData = Uint8List(0);

  Duration deltaTime = Duration();
  DateTime _lastTime = DateTime(0);

  /* Actions */
  void updateCummState(CommState commState) {
    this.commState = commState;
    notifyListeners();
  }

  void setConnection(String port) {
    if (port == 'none') {
      if (serialPort != null && serialPort!.isOpen) {
        reader?.close();
        serialPort?.close();
        commState = CommState.disconnected;
      }
      return;
    } else if (serialPort != null) {
      if (serialPort!.isOpen) {
        reader?.close();
        serialPort?.close();
        commState = CommState.disconnected;
      }
    }
    serialPort = SerialPort(port);
    if (serialPort!.openReadWrite()) {
      var config = SerialPortConfig();
      config.baudRate = 115200;
      serialPort!.config = config;
      if (serialPort!.isOpen) {
        debugPrint('Serial port open!');
        commState = CommState.normal;
      }
      reader = SerialPortReader(serialPort!);
      _lastTime = DateTime.now();
      reader!.stream.listen((data) {
        _recvRawData = combineUint8List(_recvRawData, data);
        if (data.last == 10) {
          recvData = String.fromCharCodes(
              _recvRawData.sublist(0, _recvRawData.length - 1));
          _recvRawData = Uint8List(0);
          // debugPrint('received: $recvData');
          deltaTime = DateTime.now().difference(_lastTime);
          _lastTime = DateTime.now();
        }
      }, onError: (error) {
        if (error is SerialPortError) {
          debugPrint(
              'Serial error: ${error.message}, code: ${error.errorCode}');
          commState = CommState.disconnected;
        }
      });
    }
    notifyListeners();
  }

  void updateAvailablePorts() {
    availablePorts = ["none"] + SerialPort.availablePorts;
    notifyListeners();
  }

  void changeCurrentPort(String changePort) {
    currentPort = changePort;
    notifyListeners();
  }
}
