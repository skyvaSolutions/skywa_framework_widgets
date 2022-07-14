import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /*MethodChannelSkywaFrameworkWidgets platform = MethodChannelSkywaFrameworkWidgets();*/
  const MethodChannel channel = MethodChannel('skywa_framework_widgets');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

/*  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });*/
}
