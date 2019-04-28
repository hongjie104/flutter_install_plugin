#import "InstallPlugin.h"

@implementation InstallPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"install_plugin"
            binaryMessenger:[registrar messenger]];
  InstallPlugin* instance = [[InstallPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"gotoAppStore" isEqualToString:call.method]) {
    // result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    result(@"success");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
