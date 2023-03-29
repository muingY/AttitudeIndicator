import 'package:attitude_indicator/Back/Provider/ProviderSupply.dart';
import 'package:attitude_indicator/Front/Container/RootFrame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: providerSupply(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AttitudeIndicator(),
    );
  }
}

class AttitudeIndicator extends StatelessWidget {
  const AttitudeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Primary Attitude Indicator',
      home: RootFrame(),
    );
  }
}
