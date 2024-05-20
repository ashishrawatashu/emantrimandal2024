import 'dart:async';
import 'package:flutter/services.dart';

class MacAddress {
  static const MethodChannel _channel = MethodChannel('mac_address');
  static var macAddress = "";

  static Future<String> getMacAddress() async {
    try {
      _channel.invokeMethod('getMacAddress');
      print('Received erffrfrefrfrfrf: erferfrfre');
      Future.delayed(Duration(seconds: 5), () {
        _channel.setMethodCallHandler(_handleMethod);
        print("MAC ADDRESS" + macAddress);
      });

      return macAddress;
    } on PlatformException catch (e) {
      print("Failed to get MAC address: '${e.message}'.");
      return "null";
    }
  }

  static Future<void> _handleMethod(MethodCall call) async {
    print("1====>${call.method}");
    switch (call.method) {
      case 'getMacAddress':
        print("1===>");
        macAddress = call.arguments;
        print("MAC ADDRESS" + call.arguments);
        print("MAC ADDRESS" + macAddress);
    }
  }
}
