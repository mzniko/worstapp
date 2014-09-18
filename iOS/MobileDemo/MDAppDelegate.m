//
//  MDAppDelegate.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDAppDelegate.h"
#import "NRMADemoTools.h"

@interface NewRelic (demo)
+ (void)startWithApplicationToken:(NSString*)appToken
              andCollectorAddress:(NSString*)url
         andCrashCollectorAddress:(NSString *)crashCollectorUrl
                          withSSL:(BOOL)useSSL;

@end

@implementation MDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    NSString *version = [[NSUserDefaults standardUserDefaults] valueForKey:@"CustomAppVersion"];
    if (! version) {
        version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        if (! [version length]) {
            version = @"1.0";
        }
        [[NSUserDefaults standardUserDefaults] setValue:version forKey:@"CustomAppVersion"];
    }

    [NRMADemoTools setApplicationVersion:version];
    [NRLogger setLogLevels:NRLogLevelALL];

    // https://staging.newrelic.com/accounts/340262/mobile/64968/
    [NewRelic startWithApplicationToken:@"AA8af476cb7cab516d0e97bf9b429c51cfce88f672"
                    andCollectorAddress:@"staging-mobile-collector.newrelic.com"
               andCrashCollectorAddress:@"staging-mobile-crash.newrelic.com"
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
