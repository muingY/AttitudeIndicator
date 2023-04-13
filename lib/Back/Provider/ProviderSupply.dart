// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/AttitudeDataProvider.dart';
import 'package:attitude_indicator/Back/Provider/Providers/CentralLayoutProvider.dart';
import 'package:attitude_indicator/Back/Provider/Providers/SerialCummProvider.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> providerSupply() {
  return [
    ChangeNotifierProvider(create: (_) => AttitudeDataProvider()),
    ChangeNotifierProxyProvider<AttitudeDataProvider, SerialCummProvider>(
      update: (_, attitudeData, serialCumm) =>
          serialCumm!..setAttitudeDataProvider(attitudeData),
      create: (BuildContext context) => SerialCummProvider(),
    ),
    ChangeNotifierProvider(create: (_) => CentralLayoutProvider())
  ];
}
