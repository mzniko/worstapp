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
#define kDefaultStagingAppToken @"AAdaadfffd66136dda8bf2122c7f15b960ff528cd4"

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
        return @"staging-mobile-collector.newrelic.com";
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


static NSString *_udid = nil;
static NSString *_username = nil;
static NSString *_userid = nil;
static NSString *_email = nil;
static NSString *_subscriptionLevel = nil;
static NSString *_campaignId = nil;
static NSString *_signupMonth = nil;

+ (void)initUserInfo
{
        switch (rand() % 10) {
            case 0:
                _udid = @"F5EA7B4F-ACE8-4687-8A59-AD440ECF1EE7";
                _username = @"Benjamin Button";
                _userid = @"13324";
                _email = @"bbutton@newrelic.com";
                _subscriptionLevel = @"Pro";
                _campaignId = @"WEB-101";
                _signupMonth = @"April 2015";
                break;
            case 1:
                _udid = @"2D187A9D-E38C-46B8-92AC-BF0433E975D3";
                _username = @"Sean Similar";
                _userid = @"487";
                _email = @"ssimilar@newrelic.com";
                _subscriptionLevel = @"SMB";
                _campaignId = @"TWITTER";
                _signupMonth = @"March 2015";
                break;
            case 2:
                _udid = @"76567CB6-B07D-493C-85DF-6A5382A1515D";
                _username = @"Lucy Lateral";
                _userid = @"4362";
                _email = @"llateral@newrelic.com";
                _subscriptionLevel = @"Lite";
                _campaignId = @"WEB-101";
                _signupMonth = @"February 2015";
                break;
            case 3:
                _udid = @"D42449EA-F8E9-4581-82AD-B74BE5B9DE3A";
                _username = @"Mark Manatee";
                _userid = @"9773";
                _email = @"mmanatee@newrelic.com";
                _subscriptionLevel = @"Pro";
                _campaignId = @"IN APP X-PROMO";
                _signupMonth = @"March 2015";
                break;
            case 4:
                _udid = @"C61C0E01-CDCC-4862-8371-6D0285B2F9CD";
                _username = @"Heinrich Hichart";
                _userid = @"92907";
                _email = @"hhichart@newrelic.com";
                _subscriptionLevel = @"SMB";
                _campaignId = @"IN APP X-PROMO";
                _signupMonth = @"March 2015";
                break;
            case 5:
                _udid = @"847F537D-5837-4BB9-A671-23C8184A7DFA";
                _username = @"Zoe Zookeeper";
                _userid = @"29931";
                _email = @"zzookeeper@newrelic.com";
                _subscriptionLevel = @"Lite";
                _campaignId = @"IN APP X-PROMO";
                _signupMonth = @"March 2015";
                break;
            case 6:
                _udid = @"E65EC67F-C654-4A42-AFC8-947F94DA74FE";
                _username = @"Ivan Intelligentsia";
                _userid = @"923";
                _email = @"iintelligentsia@newrelic.com";
                _subscriptionLevel = @"Pro";
                _campaignId = @"WEB-101";
                _signupMonth = @"April 2015";
                break;
            case 7:
                _udid = @"44A46106-FFBD-4C83-AB31-76909B7AD5F7";
                _username = @"Bob Beauchamp";
                _userid = @"348957";
                _email = @"bbeauchamp@newrelic.com";
                _subscriptionLevel = @"SMB";
                _campaignId = @"IN APP X-PROMO";
                _signupMonth = @"March 2015";
                break;
            case 8:
                _udid = @"86FCACA8-09D8-4EC5-AF97-E3C19D9496EA";
                _username = @"Kelly Koala";
                _userid = @"348";
                _email = @"kkoala@newrelic.com";
                _subscriptionLevel = @"Lite";
                _campaignId = @"WEB-101";
                _signupMonth = @"May 2015";
                break;
            case 9:
                _udid = @"B5B7163C-9ECB-465C-8591-D1E3BB2CE302";
                _username = @"Janice Juniper";
                _userid = @"76522";
                _email = @"jjuniper@newrelic.com";
                _subscriptionLevel = @"Pro";
                _campaignId = @"WEB-101";
                _signupMonth = @"April 2015";
                break;
        }
}
+ (NSString *)deviceUdid
{
    return _udid;
}
+ (NSString *)username
{
    return _username;
}
+ (NSString *)email
{
    return _email;
}
+ (NSString *)userId
{
    return _userid;
}
+ (NSString *)subscriptionLevel
{
    return _subscriptionLevel;
}
+ (NSString *)signupMonth
{
    return _signupMonth;
}
+ (NSString *)campaignId
{
    return _campaignId;
}

@end
