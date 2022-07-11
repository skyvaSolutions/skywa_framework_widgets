import 'skywa_framework_widgets_platform_interface.dart';

class SkywaFrameworkWidgets {
  Future<String?> getPlatformVersion() {
    return SkywaFrameworkWidgetsPlatform.instance.getPlatformVersion();
  }
}
