import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class BatteryLevel {
  static const MethodChannel _channel = MethodChannel('battery_level');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> get batteryLevel async {
    final String? battery = await _channel.invokeMethod('getBatteryLevel');
    return battery;
  }

  static Future<String?> get batteryInformation async {
    final String? batteryInformationJson =
        await _channel.invokeMethod('getBatteryInformation');
    return batteryInformationJson;
  }

  static Stream<BatteryInformation> batteryInformationStream() {
    const EventChannel _stream = EventChannel('channel/battery_info');
    return _stream.receiveBroadcastStream().distinct().map((data) {
      final parsed = jsonDecode(data as String) as Map<String, dynamic>;
      return BatteryInformation(
          parsed['batteryLevel'] as int, parsed['isCharing'] as bool);
    });
  }
}

class BatteryInformation {
  int batteryLevel;
  bool isCharging;

  BatteryInformation(this.batteryLevel, this.isCharging);
}
