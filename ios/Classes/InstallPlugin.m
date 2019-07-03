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
    NSDictionary *dic = call.arguments;
    NSString *id = dic[@"id"];
    NSString *str =[[@"itms-apps://itunes.apple.com/cn/app/id" stringByAppendingString:id] stringByAppendingString:@"?mt=8"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    result(@"success");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
