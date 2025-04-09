package com.smart.chart

import android.view.KeyEvent
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import android.provider.Settings 
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "my_channel").setMethodCallHandler {
                call, result ->
            when (call.method) {
                "getAndroidId" -> {
                    val androidID = Settings.Secure.getString(
                        contentResolver,
                        Settings.Secure.ANDROID_ID
                    )
                    if (androidID != null) {
                        // Return the first 8 chars, just like your Kotlin function
                        result.success(androidID.substring(0, 8))
                    } else {
                        result.success("00000000")
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
