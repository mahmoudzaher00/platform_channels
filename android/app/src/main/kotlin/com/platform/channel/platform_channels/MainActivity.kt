package com.platform.channel.platform_channels

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.native.channel"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getSum") {
                val num1: Double = call.argument<Double>("num1") ?: 0.0
                val num2: Double = call.argument<Double>("num2") ?: 0.0
                val sum = num1 + num2
                result.success(sum)
            } else if (call.method == "getName") {
                val name: String = call.argument<String>("name") ?: ""
                result.success(name)
            }
            else {
                result.notImplemented()
            }
        }
    }
}
