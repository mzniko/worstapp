//
//  MDSettings.h
//  MobileDemo
//
//  Created by Jonathan Karon on 10/1/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDSettings : NSObject

+ (void)applySettings;

+ (NSString *)appVersion;
+ (void)incrementAppVersion;
+ (void)setAppVersion:(NSString *)version;

+ (NSString *)collectorHostname;
+ (NSString *)crashCollectorHostname;
+ (BOOL)useProductionCollector;
+ (void)setUseProductionCollector:(BOOL)production;

+ (NSString *)appToken;
+ (void)setAppToken:(NSString *)appToken;

+ (BOOL)deviceChameleonEnabled;
+ (void)setDeviceChameleonEnabled:(BOOL)enabled;

+ (void)initUserInfo;

+ (NSString *)deviceUdid;
+ (NSString *)username;
+ (NSString *)email;
+ (NSString *)userId;

@end
