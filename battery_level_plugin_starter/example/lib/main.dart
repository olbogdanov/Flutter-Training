import 'dart:async';
import 'dart:convert';

import 'package:battery_level/battery_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _batteryLevel = 'Unknown btl';
  BatteryInformation _batteryInformation = BatteryInformation(99, false);
  BatteryInformation _dynamicBatteryInformation = BatteryInformation(99, false);

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    BatteryLevel.batteryInformationStream().listen((batteryInformation) {
      setState(() {
        _dynamicBatteryInformation = batteryInformation;
      });
    });

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await BatteryLevel.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String batteryLevel;

    try {
      batteryLevel = await BatteryLevel.batteryLevel ?? 'unknown battery level';
    } on PlatformException {
      batteryLevel = 'battery level is not available';
    }

    BatteryInformation batteryInformation = BatteryInformation(55, false);

    try {
      String batteryInformationJson =
          await BatteryLevel.batteryInformation ?? '[]';
      Map<String, dynamic> parsed =
          jsonDecode(batteryInformationJson) as Map<String, dynamic>;

      batteryInformation =
          BatteryInformation(parsed['batteryLevel'], parsed['isCharing']);
    } on PlatformException {
      print('battery information is not available');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _batteryLevel = batteryLevel;
      _batteryInformation = batteryInformation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('Battery level: $_batteryLevel\n'),
              Text(
                  'Battery level: ${_batteryInformation.batteryLevel}\n charging: ${_batteryInformation.isCharging}'),
              TextButton(
                  onPressed: () => {initPlatformState()},
                  child: const Text("REFRESH")),
            ],
          ),
        ),
      ),
    );
  }
}
