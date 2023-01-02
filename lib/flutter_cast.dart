
import 'flutter_cast_platform_interface.dart';

class FlutterCast {
  Future<String?> getPlatformVersion() {
    return FlutterCastPlatform.instance.getPlatformVersion();
  }
}
