import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_cast_platform_interface.dart';

/// An implementation of [FlutterCastPlatform] that uses method channels.
class MethodChannelFlutterCast extends FlutterCastPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_cast');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<String?> setCastId(String key) async {

    final  numNotesOn =
    await methodChannel.invokeMethod('castId', key);
    return numNotesOn;
  }
}
