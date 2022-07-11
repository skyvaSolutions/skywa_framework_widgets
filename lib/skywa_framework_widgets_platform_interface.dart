import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'skywa_framework_widgets_method_channel.dart';

abstract class SkywaFrameworkWidgetsPlatform extends PlatformInterface {
  /// Constructs a SkywaFrameworkWidgetsPlatform.
  SkywaFrameworkWidgetsPlatform() : super(token: _token);

  static final Object _token = Object();

  static SkywaFrameworkWidgetsPlatform _instance = MethodChannelSkywaFrameworkWidgets();

  /// The default instance of [SkywaFrameworkWidgetsPlatform] to use.
  ///
  /// Defaults to [MethodChannelSkywaFrameworkWidgets].
  static SkywaFrameworkWidgetsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SkywaFrameworkWidgetsPlatform] when
  /// they register themselves.
  static set instance(SkywaFrameworkWidgetsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
