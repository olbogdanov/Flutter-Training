import Flutter
import UIKit

public class SwiftBatteryLevelPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery_level", binaryMessenger: registrar.messenger())
    let instance = SwiftBatteryLevelPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch(call.method) {
      case "getPlatformVersion":
          result("iOS " + UIDevice.current.systemVersion)
      case "getBatteryLevel":
          result("" + UIDevice.current.battery_level)
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}
