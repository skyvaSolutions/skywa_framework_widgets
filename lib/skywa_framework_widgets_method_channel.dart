import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'skywa_framework_widgets_platform_interface.dart';

/// An implementation of [SkywaFrameworkWidgetsPlatform] that uses method channels.
class MethodChannelSkywaFrameworkWidgets extends SkywaFrameworkWidgetsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('skywa_framework_widgets');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
