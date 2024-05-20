package com.nic.emantrimandal

import android.content.Context
import android.net.wifi.WifiManager
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){

    companion object {
        private const val SERVICE_CHANNEL = "mac_address"
    }


    private val methodChannel: MethodChannel? by lazy {
        flutterEngine?.dartExecutor?.binaryMessenger?.let { messenger ->
            MethodChannel(messenger, SERVICE_CHANNEL)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel?.setMethodCallHandler{
            call: MethodCall, result: MethodChannel.Result ->
            if (call.method== "getMacAddress" ){
                var macAddress = getMacAddress()
                if(macAddress!=null){
                    sendMacAddressToDart(macAddress)
                }
            }
        }
    }

    private fun sendMacAddressToDart(macAddress: String) {
        methodChannel?.invokeMethod("getMacAddress",macAddress)

    }


    private fun getMacAddress(): String? {
        return try {
            val manager = application.getSystemService(Context.WIFI_SERVICE) as WifiManager
            val info = manager.connectionInfo
            Log.e("macAddress",info.macAddress.toUpperCase())
            return info.macAddress.toUpperCase()
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
}




