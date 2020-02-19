package com.example.flutter_app1

import android.os.Bundle
import com.example.flutter_app1.plugin.ToastProvidePlugin

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    ToastProvidePlugin.register(this,flutterView)
  }
}
