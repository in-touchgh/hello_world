package com.example.hello_world_project

import com.example.hello_world_android.HelloWorldAndroid
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "helloWorld"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "getMessage") {
                val message = HelloWorldAndroid.getMessage()
                result.success(message)
            } else {
                result.notImplemented()
            }
        }
    }
}
