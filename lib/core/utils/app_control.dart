import 'package:flutter/services.dart';

class AppControlManager {
  static const MethodChannel _channel = MethodChannel('myapp/app_control');

  static Future<void> disableScreenCapture() async {
    try {
      await _channel.invokeMethod('disableScreenCapture');
    } on PlatformException catch (e) {
      print("Failed to disable screen capture: '${e.message}'.");
    }
  }

  static Future<void> enableScreenCapture() async {
    try {
      await _channel.invokeMethod('enableScreenCapture');
    } on PlatformException catch (e) {
      print("Failed to enable screen capture: '${e.message}'.");
    }
  }

  static Future<void> disablePrinters() async {
    try {
      await _channel.invokeMethod('disablePrinters');
    } on PlatformException catch (e) {
      print("Failed to disable printers: '${e.message}'.");
    }
  }
}