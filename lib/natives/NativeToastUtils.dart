
import 'package:flutter/services.dart';

class NativeToastUtils{


  static const _platform= const MethodChannel("com.cobra.frameword.plugins/toast");

  static void showShortToast({String message}){
    _platform.invokeMethod("showShortToast",{ 'message': '$message'});
  }

  static void showLongToast({String message}){
    _platform.invokeMethod("showLongToast",{ 'message': '$message'});
  }

  static void showToast({String message}){
    _platform.invokeMethod("showToast",{ 'message': '$message'});
  }

}