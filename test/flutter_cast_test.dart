import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cast/flutter_cast.dart';
import 'package:flutter_cast/flutter_cast_platform_interface.dart';
import 'package:flutter_cast/flutter_cast_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCastPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterCastPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterCastPlatform initialPlatform = FlutterCastPlatform.instance;

  test('$MethodChannelFlutterCast is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterCast>());
  });

  test('getPlatformVersion', () async {
    FlutterCast flutterCastPlugin = FlutterCast();
    MockFlutterCastPlatform fakePlatform = MockFlutterCastPlatform();
    FlutterCastPlatform.instance = fakePlatform;
  
    expect(await flutterCastPlugin.getPlatformVersion(), '42');
  });
}
