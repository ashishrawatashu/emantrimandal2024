import 'dart:async';
import 'package:emantrimandal/core/utils/singleton.dart';
import 'package:flutter/services.dart';

class MacAddress {
  static const MethodChannel _channel = MethodChannel('mac_address');
  static var macAddress = "";

  static Future<String> getMacAddress() async {
    try {
      Future.delayed(Duration(seconds: 1), () async {
        _channel.setMethodCallHandler(_handleMethod);
         print("MAC ADDRESS=====" + macAddress);
         MySingleton().MAC = macAddress;
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
        macAddress = call.arguments;
        print("MACADDRESS==1" + call.arguments);
        print("MACADDRESS==2" + macAddress);
    }
  }


  static Future<String> getMacAddressForWindows() async {
    MethodChannel channel = const MethodChannel('mac_address');
    try {
      final String result = await channel.invokeMethod('getMacAddress');
      print(result+" MY MAC ADDRESS ");
      return result;
    } on PlatformException catch (e) {
      print("Failed to get mac address: '${e.message}'.");
      return ""; // Return an empty string or handle the error as needed
    }
  }
}
