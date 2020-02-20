import 'package:flutter/services.dart';
import 'dart:io';

class NativeToastUtils {
  static const _platform =
      const MethodChannel("com.cobra.frameword.plugins/toast");

  static void showShortToast({String message}) {
    if (Platform.isAndroid) {
      _platform.invokeMethod("showShortToast", {'message': '$message'});
    }
  }

  static void showLongToast({String message}) {
    if (Platform.isAndroid) {
      _platform.invokeMethod("showLongToast", {'message': '$message'});
    }
  }

  static void showToast({String message}) {
    if (Platform.isAndroid) {
      _platform.invokeMethod("showToast", {'message': '$message'});
    }
  }
}
