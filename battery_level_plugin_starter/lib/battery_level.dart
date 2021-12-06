import 'dart:async';

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
}
