//
//  MDAppDelegate.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDAppDelegate.h"
#import "NRMADemoTools.h"
#import "MDSettings.h"

@interface NewRelic (demo)
+ (void)startWithApplicationToken:(NSString*)appToken
              andCollectorAddress:(NSString*)url
         andCrashCollectorAddress:(NSString *)crashCollectorUrl
                          withSSL:(BOOL)useSSL;

@end

@implementation MDAppDelegate

- (void)setupDemoAppState
{
    [NRMADemoTools collectAllInteractionTraces];
    
    sranddev();

    // random hardware...
    switch (rand() % 13) {
        case 0: [NRMADemoTools setDeviceModel:@"iPhone4,1"]; break;
        case 1: [NRMADemoTools setDeviceModel:@"iPhone5,1"]; break;
        case 2: [NRMADemoTools setDeviceModel:@"iPhone5,2"]; break;
        case 3: [NRMADemoTools setDeviceModel:@"iPhone5,3"]; break;
        case 4: [NRMADemoTools setDeviceModel:@"iPhone6,1"]; break;
        case 5: [NRMADemoTools setDeviceModel:@"iPod5,1"]; break;
        case 6: [NRMADemoTools setDeviceModel:@"iPod6,1"]; break;
        case 7: [NRMADemoTools setDeviceModel:@"iPad3,1"]; break;
        case 8: [NRMADemoTools setDeviceModel:@"iPad4,1"]; break;
        case 9: [NRMADemoTools setDeviceModel:@"iPad4,5"]; break;
        case 10: [NRMADemoTools setDeviceModel:@"iPad2,5"]; break;
        case 11: [NRMADemoTools setDeviceModel:@"iPhone5,3"]; break;
        case 12: [NRMADemoTools setDeviceModel:@"iPhone6,1"]; break;
    }

    // random OS
    switch (rand() % 10) {
        case 0: [NRMADemoTools setOsVersion:@"7.0.1"]; break;
        case 1: [NRMADemoTools setOsVersion:@"7.1.1"]; break;
        case 2: [NRMADemoTools setOsVersion:@"7.1.0"]; break;
        case 3: [NRMADemoTools setOsVersion:@"7.1.2"]; break;
        case 4: [NRMADemoTools setOsVersion:@"7.1.2"]; break;
        case 5: [NRMADemoTools setOsVersion:@"7.1.2"]; break;
        case 6: [NRMADemoTools setOsVersion:@"7.1.2"]; break;
        case 7: [NRMADemoTools setOsVersion:@"7.1.2"]; break;
        case 8: [NRMADemoTools setOsVersion:@"8.0"]; break;
        case 9: [NRMADemoTools setOsVersion:@"8.0"]; break;
    }

    // random carrier
    switch (rand() % 11) {
        case 0: [NRMADemoTools setCarrierName:@"AT&T"]; break;
        case 1: [NRMADemoTools setCarrierName:@"Verizon"]; break;
        case 2: [NRMADemoTools setCarrierName:@"AT&T"]; break;
        case 3: [NRMADemoTools setCarrierName:@"Verizon"]; break;
        case 4: [NRMADemoTools setCarrierName:@"T-Mobile"]; break;
        case 5: [NRMADemoTools setCarrierName:@"Sprint"]; break;
        case 6: [NRMADemoTools setCarrierName:@"O2"]; break;
        case 7: [NRMADemoTools setCarrierName:@"wifi"]; break;
        case 8: [NRMADemoTools setCarrierName:@"wifi"]; break;
        case 9: [NRMADemoTools setCarrierName:@"wifi"]; break;
        case 10: [NRMADemoTools setCarrierName:@"wifi"]; break;
    }


    // random uuid
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    [NRMADemoTools setDeviceId:(NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid))];
    CFRelease(uuid);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self setupDemoAppState];
    [MDSettings applySettings];

    [NRLogger setLogLevels:NRLogLevelALL];

    // https://staging.newrelic.com/accounts/340262/mobile/64968/
    [NewRelic startWithApplicationToken:[MDSettings appToken]
                    andCollectorAddress:[MDSettings collectorHostname]
               andCrashCollectorAddress:[MDSettings crashCollectorHostname]
                                withSSL:YES];

    NSString *interaction = NR_START_NAMED_INTERACTION(@"App Setup");

    [self initAppContext];

    NR_INTERACTION_STOP(interaction);
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self setupDemoAppState];
    [NRMADemoTools forceReconnect];

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) initAppContext
{
    NR_TRACE_METHOD_START(NRTraceTypeJson);

    [NSThread sleepForTimeInterval:0.15];

    NR_TRACE_METHOD_STOP;
}

@end
