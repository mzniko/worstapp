//
//  MDSettings.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/1/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDSettings.h"
#import "NRMADemoTools.h"


#define kUseProductionCollector @"MDUseProductionCollector"
#define kDisableChameleon @"MDDisableChameleon"
#define kCustomAppVersion @"MDCustomAppVersion"
#define kAppToken @"MDAppToken"
#define kDefaultStagingAppToken @"AA8af476cb7cab516d0e97bf9b429c51cfce88f672"

#define kStagingInsightsCollector @"staging-insights-collector.newrelic.com"
#define kStagingAccountId 340262
#define kStagingAccountInsertKey @"Kl__l1ZW9edgH7ReODSFW-I9Vtl2o99t"

#define kProductionInsightsCollector @"insights-collector.newrelic.com"
#define kProductionAccountId 1
#define kProductionAccountInsertKey @"o3txgeZWickYLJMym4TeORBERR9OXiPU"


@implementation MDSettings



+ (void)applySettings
{
    [NRMADemoTools setApplicationVersion:[MDSettings appVersion]];
    [NRMADemoTools setCollectorHost:[MDSettings collectorHostname]];
    [NRMADemoTools setApplicationToken:[MDSettings appToken]];

    if ([NewRelicAgentInternal sharedInstance].enabled) {
        [NRMADemoTools forceReconnect];
    }
}

+ (NSString *)appVersion
{
    NSString *version = [[NSUserDefaults standardUserDefaults] valueForKey:kCustomAppVersion];
    if (! version) {
        version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        if (! [version length]) {
            version = @"1.0";
        }
        [self setAppVersion:version];
    }

    return version;
}
+ (void)incrementAppVersion
{
    NSString *version = [MDSettings appVersion];

    NSMutableArray *components = [[version componentsSeparatedByString:@"."] mutableCopy];
    NSInteger newValue = [[components lastObject] integerValue] + 1;
    components[components.count-1] = [NSString stringWithFormat:@"%02d", (int)newValue];

    [self setAppVersion:[components componentsJoinedByString:@"."]];
}
+ (void)setAppVersion:(NSString *)version
{
    [[NSUserDefaults standardUserDefaults] setValue:version forKey:kCustomAppVersion];
    [NRMADemoTools setApplicationVersion:version];
}



+ (NSString *)collectorHostname
{
    if ([MDSettings useProductionCollector]) {
        return @"mobile-collector.newrelic.com";
    }
    else {
        return @"staging-collector.newrelic.com";
    }
}
+ (NSString *)crashCollectorHostname
{
    if ([MDSettings useProductionCollector]) {
        return @"mobile-crash-collector.newrelic.com";
    }
    else {
        return @"staging-mobile-crash.newrelic.com";
    }
}
+ (BOOL)useProductionCollector
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kUseProductionCollector] != nil;
}
+ (void)setUseProductionCollector:(BOOL)production
{
    if (production) {
        [[NSUserDefaults standardUserDefaults] setValue:@"yes" forKey:kUseProductionCollector];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUseProductionCollector];
    }
}

+ (NSString *)insightsInsertKey
{
    if ([MDSettings useProductionCollector])
        return kProductionAccountInsertKey;
    else
        return kStagingAccountInsertKey;
}
+ (NSString *) insightsCollectorHostname
{
    if ([MDSettings useProductionCollector])
        return kProductionInsightsCollector;
    else
        return kStagingInsightsCollector;
}
+ (NSInteger) insightsAccountId
{
    if ([MDSettings useProductionCollector])
        return kProductionAccountId;
    else
        return kStagingAccountId;
}


+ (NSString *)appToken
{
    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:kAppToken];
    if (! token) {
        token = kDefaultStagingAppToken;
        [MDSettings setAppToken:token];
    }
    return token;
}
+ (void)setAppToken:(NSString *)appToken
{
    [[NSUserDefaults standardUserDefaults] setValue:appToken forKey:kAppToken];
}

+ (BOOL)deviceChameleonEnabled
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kDisableChameleon] == nil;
}
+ (void)setDeviceChameleonEnabled:(BOOL)enabled
{
    if (enabled) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kDisableChameleon];
    }
    else {
        [[NSUserDefaults standardUserDefaults] setValue:@"yes" forKey:kDisableChameleon];
    }
}


@end
