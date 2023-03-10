package innovature.cast.flutter_cast

import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterEngineConfigurator
import io.flutter.embedding.engine.FlutterEngine

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result



class FlutterCastPlugin : FlutterPlugin, MethodCallHandler {
        /// The MethodChannel that will the communication between Flutter and native Android
        ///
        /// This local reference serves to register the plugin with the Flutter Engine and unregister it
        /// when the Flutter Engine is detached from the Activity
        private lateinit var channel: MethodChannel
        private lateinit var castId: String

        override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
            channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_cast")
            channel.setMethodCallHandler(this)

            flutterPluginBinding
                .platformViewRegistry
                .registerViewFactory("CastButton", NativeViewFactory())

        }


        override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
            if (call.method == "getPlatformVersion") {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            } else if (call.method == "castId") {
                castId = call.arguments.toString()
                Log.d("CASTID", castId)
            } else {
                result.notImplemented()
            }
        }

        override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
            channel.setMethodCallHandler(null)


        }
    }

