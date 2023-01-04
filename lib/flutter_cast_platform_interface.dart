import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_cast_method_channel.dart';

abstract class FlutterCastPlatform extends PlatformInterface {
  /// Constructs a FlutterCastPlatform.
  FlutterCastPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterCastPlatform _instance = MethodChannelFlutterCast();

  /// The default instance of [FlutterCastPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterCast].
  static FlutterCastPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterCastPlatform] when
  /// they register themselves.
  static set instance(FlutterCastPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> setCastId(String key) {
    throw UnimplementedError('setCastId() has not been implemented.');
  }
}
