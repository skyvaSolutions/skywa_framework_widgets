#import "SkywaFrameworkWidgetsPlugin.h"
#if __has_include(<skywa_framework_widgets/skywa_framework_widgets-Swift.h>)
#import <skywa_framework_widgets/skywa_framework_widgets-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "skywa_framework_widgets-Swift.h"
#endif

@implementation SkywaFrameworkWidgetsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSkywaFrameworkWidgetsPlugin registerWithRegistrar:registrar];
}
@end
