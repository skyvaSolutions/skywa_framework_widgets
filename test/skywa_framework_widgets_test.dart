import 'package:flutter_test/flutter_test.dart';
import 'package:skywa_framework_widgets/skywa_framework_widgets.dart';
import 'package:skywa_framework_widgets/skywa_framework_widgets_platform_interface.dart';
import 'package:skywa_framework_widgets/skywa_framework_widgets_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSkywaFrameworkWidgetsPlatform
    with MockPlatformInterfaceMixin
    implements SkywaFrameworkWidgetsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SkywaFrameworkWidgetsPlatform initialPlatform =
      SkywaFrameworkWidgetsPlatform.instance;

  test('$MethodChannelSkywaFrameworkWidgets is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSkywaFrameworkWidgets>());
  });

  test('getPlatformVersion', () async {
    SkywaFrameworkWidgets skywaFrameworkWidgetsPlugin = SkywaFrameworkWidgets();
    MockSkywaFrameworkWidgetsPlatform fakePlatform =
        MockSkywaFrameworkWidgetsPlatform();
    SkywaFrameworkWidgetsPlatform.instance = fakePlatform;

    expect(await skywaFrameworkWidgetsPlugin.getPlatformVersion(), '42');
  });
}
