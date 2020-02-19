package com.example.flutter_app1.plugin

import android.content.Context
import android.os.Message
import android.widget.Toast
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

object ToastProvidePlugin{

    private const val ChannelName="com.cobra.frameword.plugins/toast"


    fun register(context: Context,messager: BinaryMessenger)=MethodChannel(messager, ChannelName)
            .setMethodCallHandler{methodCall, result ->
                when(methodCall.method){
                    "showShortToast" -> showTaost(context,methodCall.argument<String>("message"),Toast.LENGTH_SHORT)
                    "showLongToast" -> showTaost(context,methodCall.argument<String>("message"),Toast.LENGTH_LONG)
                    "showToast" -> showTaost(context,methodCall.argument<String>("message"),Toast.LENGTH_SHORT)
                }

            }


    private fun  showTaost(context: Context,message: String?,dunration: Int)=Toast.makeText(context,message,dunration).show();


}