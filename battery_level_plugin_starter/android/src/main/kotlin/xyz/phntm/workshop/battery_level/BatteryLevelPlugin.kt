package xyz.phntm.workshop.battery_level

import androidx.annotation.NonNull
import android.content.Context
import android.content.Context.BATTERY_SERVICE
import android.os.BatteryManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.google.gson.Gson

/** BatteryLevelPlugin */
class BatteryLevelPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "battery_level")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext

  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getBatteryLevel") {
      val battery = getCurrentBattery()
      result.success("$battery")
    } else if (call.method == "getBatteryInformation") {
      val battery = getCurrentBattery()
      val gson = Gson()
      val batteryInfo = BatteryInformation(battery, true)
      val json: String = gson.toJson(batteryInfo)
      result.success(json)
    } else {
      result.notImplemented()
    }
  }

  private fun getCurrentBattery(): Int {
    val bm = context.getSystemService(BATTERY_SERVICE) as BatteryManager
    val battery = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    return battery
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

data class BatteryInformation(val batteryLevel: Int, val isCharing: Boolean)
